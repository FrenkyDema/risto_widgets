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
    // Define the quantities outside the builder to maintain state
    int quantity1 = 1;
    int quantity2 = 5;
    int quantity3 = 8;
    int quantity4 = 2; // For the squared buttons example

    return StatefulBuilder(
      builder: (context, setState) {
        return PaddedChildrenList(
          children: [
            Text(
              'Increment/Decrement Widget',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            // Flat Example
            IncrementDecrementWidget.flat(
              quantity: quantity1,
              maxQuantity: 10,
              minValue: 1,
              onChanged: (newQuantity) {
                setState(() {
                  quantity1 = newQuantity;
                });
              },
              backgroundColor: Colors.grey[200],
              iconColor: Colors.blue,
            ),

            const SizedBox(height: 16),

            // Raised Example
            IncrementDecrementWidget.raised(
              quantity: quantity2,
              maxQuantity: 15,
              minValue: 0,
              onChanged: (newQuantity) {
                setState(() {
                  quantity2 = newQuantity;
                });
              },
              backgroundColor: Colors.lightGreen[100],
              iconColor: Colors.green,
            ),

            const SizedBox(height: 16),

            // Minimal Example
            IncrementDecrementWidget.minimal(
              quantity: quantity3,
              maxQuantity: 20,
              minValue: 5,
              onChanged: (newQuantity) {
                setState(() {
                  quantity3 = newQuantity;
                });
              },
              iconColor: Colors.red,
            ),

            const SizedBox(height: 16),

            // Squared Buttons Example
            IncrementDecrementWidget.squared(
              quantity: quantity4,
              // No minValue or maxQuantity specified for infinite increment/decrement
              alignment: MainAxisAlignment.center,
              onChanged: (newQuantity) {
                setState(() {
                  quantity4 = newQuantity;
                });
              },
              backgroundColor: Colors.orange[100],
              iconColor: Colors.orange,
              buttonSize: 60.0,
              // Size of the square buttons
              borderRadius: 8.0,
              // Optional border radius for rounded corners
              incrementIcon: const Icon(Icons.add),
              decrementIcon: const Icon(Icons.remove),
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
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Custom Action Buttons',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              // Elevated Button Example
              CustomActionButton.elevated(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 4.0,
                borderRadius: 8.0,
                child: Text('Elevated Button ($counter)'),
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
                splashColor: Colors.white.withOpacity(0.2),
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
              const SizedBox(height: 16),
              // Long Press Button Example
              CustomActionButton.longPress(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                onLongPress: () {
                  setState(() {
                    counter += 2;
                  });
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                elevation: 4.0,
                borderRadius: 8.0,
                child: Text('Long Press Button ($counter)'),
              ),
            ],
          ),
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
              body: const Text('Are you sure you want to proceed?'),
              onClose: (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      value == true ? 'Action Confirmed' : 'Action Cancelled'),
                ));
              },
              backgroundColor: Colors.white,
              handleColor: Colors.grey,
              firstButtonColor: Colors.red,
              secondButtonColor: Colors.green,
              firstButtonTextColor: Colors.white,
              secondButtonTextColor: Colors.white,
              buttonSpacing: 8.0,
            ).show(context);
          },
          child: const Text('Open Confirm Sheet'),
        ),
        ElevatedButton(
          onPressed: () {
            OpenCustomSheet.scrollableSheet(
              context,
              initialChildSize: 0.5, // Start smaller
              minChildSize: 0.25,
              maxChildSize: 1.0,
              body: ({scrollController}) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: 50,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item $index'),
                  ),
                );
              },
            ).show(context);
          },
          child: const Text('Open Scrollable Sheet'),
        ),

        
        ElevatedButton(
          onPressed: () {
            OpenCustomSheet(
              scrollable: false,
              expand: false,
              initialChildSize: 0.7,
              minChildSize: 0.5,
              maxChildSize: 0.8,
              barrierColor: Colors.black.withOpacity(0.5),
              body: ({scrollController}) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  // Background color for the sheet
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 32,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter Details',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomActionButton.flat(
                      onPressed: () => Navigator.pop(context, 'Submitted'),
                      backgroundColor: Colors.green,
                      margin: EdgeInsets.zero,
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ).show(context);
          },
          child: const Text('Open Custom Form Sheet'),
        ),
      ],
    );
  }
}
