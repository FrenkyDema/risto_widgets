import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Widgets Demo'),
      ),
      body: CustomBottomNavBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.blue,
        elevation: 8.0,
        itemPadding: const EdgeInsets.all(5),
        items: [
          NavigationItem(
            page: _buildIncrementDecrementPage(context),
            icon: const Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Increment/Decrement',
          ),
          NavigationItem(
            page: _buildActionButtonPage(context),
            icon: const Icon(Icons.search),
            label: 'Action Buttons',
          ),
          NavigationItem(
            page: _buildListTileButtonPage(context),
            icon: const Icon(Icons.list),
            label: 'List Tile Buttons',
          ),
          NavigationItem(
            page: _buildExpandablePage(context),
            icon: const Icon(Icons.expand),
            label: 'Expandable',
          ),
          NavigationItem(
            page: _buildCustomSheetPage(context),
            icon: const Icon(Icons.open_in_new),
            label: 'Custom Sheets',
          ),
        ],
      ),
    );
  }

  // Increment/Decrement Page
  Widget _buildIncrementDecrementPage(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        int quantity1 = 1;
        int quantity2 = 5;
        int quantity3 = 8;

        return PaddedChildrenList(
          children: [
            Text(
              'Increment/Decrement Widget',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            // Flat Example
            StatefulBuilder(
              builder: (context, setState) {
                return IncrementDecrementWidget.flat(
                  quantity: quantity1,
                  maxQuantity: 10,
                  minValue: 1,
                  onIncrement: () {
                    setState(() {
                      if (quantity1 < 10) quantity1++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (quantity1 > 1) quantity1--;
                    });
                  },
                  backgroundColor: Colors.grey[200],
                  iconColor: Colors.blue,
                );
              },
            ),

            const SizedBox(height: 16),

            // Raised Example
            StatefulBuilder(
              builder: (context, setState) {
                return IncrementDecrementWidget.raised(
                  quantity: quantity2,
                  maxQuantity: 15,
                  minValue: 0,
                  onIncrement: () {
                    setState(() {
                      if (quantity2 < 15) quantity2++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (quantity2 > 0) quantity2--;
                    });
                  },
                  backgroundColor: Colors.lightGreen[100],
                  iconColor: Colors.green,
                );
              },
            ),

            const SizedBox(height: 16),

            // Minimal Example
            StatefulBuilder(
              builder: (context, setState) {
                return IncrementDecrementWidget.minimal(
                  quantity: quantity3,
                  maxQuantity: 20,
                  minValue: 5,
                  onIncrement: () {
                    setState(() {
                      if (quantity3 < 20) quantity3++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (quantity3 > 5) quantity3--;
                    });
                  },
                  iconColor: Colors.red,
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Action Buttons Page
  Widget _buildActionButtonPage(BuildContext context) {
    int counter = 0;

    return StatefulBuilder(
      builder: (context, setState) {
        return PaddedChildrenList(
          children: [
            Text(
              'Custom Action Buttons',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // Raised Button Example
            CustomActionButton.raised(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              backgroundColor: Colors.blue,
              borderColor: Colors.blueAccent,
              elevation: 4.0,
              borderRadius: 8.0,
              child: Text('Raised Button ($counter)',
                  style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            // Flat Button Example
            CustomActionButton.flat(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              backgroundColor: Colors.green,
              borderColor: Colors.transparent,
              borderRadius: 8.0,
              child: Text('Flat Button ($counter)',
                  style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            // Minimal Button Example
            CustomActionButton.minimal(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Text('Minimal Button ($counter)',
                  style: const TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  // List Tile Buttons Page
  Widget _buildListTileButtonPage(BuildContext context) {
    return PaddedChildrenList(
      children: [
        Text(
          'List Tile Button',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        IconListTileButton(
          title: const Text('List Tile Button'),
          icon: Icons.list,
          subtitle: const Text('Subtitle'),
          onPressed: () {},
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          backgroundColor: Colors.white,
          borderColor: Colors.blue,
          iconColor: Colors.blue,
          trailing: const Icon(Icons.arrow_forward),
          size: 80,
        ),
        ListTileButton(
          body: const Text('List Tile Button'),
          subtitle: const Text('Subtitle'),
          onPressed: () {},
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          backgroundColor: Colors.white,
          borderColor: Colors.blue,
          trailing: const Icon(Icons.arrow_forward),
        ),
        const SizedBox(height: 20),
        Text(
          'Double List Tile Buttons',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        DoubleListTileButtons(
          firstButton: ListTileButton(
            body: const Center(child: Text('First Button')),
            onPressed: () {},
            backgroundColor: Colors.red,
          ),
          secondButton: ListTileButton(
            body: const Center(child: Text('Second Button')),
            onPressed: () {},
            backgroundColor: Colors.green,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          space: 16.0,
        ),
      ],
    );
  }

  // Expandable Widget Page
  Widget _buildExpandablePage(BuildContext context) {
    return PaddedChildrenList(
      children: [
        Text(
          'Expandable List Tile Button',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // Add some space between title and first item
        const SizedBox(height: 20),

        // Standard Expandable List Tile Button
        ExpandableListTileButton.listTile(
          backgroundColor: Colors.blueGrey[600],
          expandedColor: Colors.blue[300],
          expanded: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: const Text('Expanded content goes here'),
          ),
          buttonBody: const Text(
            'Expandable ListTile Button',
            style: TextStyle(color: Colors.white),
          ),
          trailing: const Icon(Icons.arrow_drop_down, color: Colors.white),
        ),
        const SizedBox(height: 20),
        // Space between items

        // Icon List Tile Button with Expandable
        ExpandableListTileButton.iconListTile(
          backgroundColor: Colors.blueGrey[600],
          expandedColor: Colors.blue[300],
          expanded: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: const Text('Expanded content goes here'),
          ),
          buttonBody: const Text(
            'Expandable IconListTile Button',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icons.account_circle,
          iconColor: Colors.white,
          trailing: const Icon(Icons.arrow_drop_down, color: Colors.white),
        ),
        const SizedBox(height: 20),
        // Space between items

        // Custom Header with Expandable Content
        ExpandableListTileButton.custom(
          backgroundColor: Colors.blueGrey[600],
          expandedColor: Colors.blue[300],
          expanded: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: const Text('Expanded content goes here'),
          ),
          customHeader: (tapAction) => CustomActionButton(
            backgroundColor: Colors.blueGrey[600],
            margin: EdgeInsets.zero,
            onPressed: () => tapAction.call(),
            child: const Center(
              child: Text(
                'Expandable CustomHeader Button',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        // Space after the last item
      ],
    );
  }

  // Custom Sheets Page
  Widget _buildCustomSheetPage(BuildContext context) {
    return PaddedChildrenList(
      children: [
        Text(
          'Custom Sheet Example',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ElevatedButton(
          onPressed: () {
            OpenCustomSheet.openConfirmSheet(
              context,
              body: const Text('Are you sure?'),
              onClose: (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(value == true ? 'Confirmed' : 'Closed'),
                ));
              },
              backgroundColor: Colors.white,
              handleColor: Colors.grey,
              buttonColor: Colors.blue,
              buttonTextColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              buttonSpacing: 16.0,
            );
          },
          child: const Text('Open Custom Sheet'),
        ),
      ],
    );
  }
}
