import 'package:expandable/expandable.dart';
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
        backgroundColor: Colors.white24,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.blue,
        elevation: 8.0,
      ),
    );
  }

  // Increment/Decrement Page
  Widget _buildIncrementDecrementPage(BuildContext context) {
    int quantity = 1;

    return StatefulBuilder(
      builder: (context, setState) {
        return PaddedChildrenList(
          children: [
            Text(
              'Increment/Decrement Widget',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            IncrementDecrementWidget(
              quantity: quantity,
              maxQuantity: 10,
              minValue: 1,
              onIncrement: () {
                setState(() {
                  if (quantity < 10) quantity++;
                });
              },
              onDecrement: () {
                setState(() {
                  if (quantity > 1) quantity--;
                });
              },
              backgroundColor: Colors.grey[200],
              iconColor: Colors.blue,
              elevation: 4.0,
              margin: const EdgeInsets.all(8.0),
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
              'Custom Action Button',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            CustomActionButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              backgroundColor: Colors.blue,
              borderColor: Colors.blueAccent,
              elevation: 4.0,
              borderRadius: 8.0,
              child: Text('Custom Action Button ($counter)',
                  style: const TextStyle(color: Colors.white)),
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
        ExpandableListTileButton.listTile(
          controller: ExpandableController(),
          backgroundColor: Colors.blueGrey,
          expandedColor: Colors.grey,
          expanded: Container(
            width: double.infinity,
            color: Colors.grey,
            padding: const EdgeInsets.all(16.0),
            child: const Text('Expanded content goes here'),
          ),
          buttonBody: const Text('Expandable ListTile Button'),
        ),
        ExpandableListTileButton.iconListTile(
          padding: const EdgeInsets.only(top: 10),
          controller: ExpandableController(),
          backgroundColor: Colors.blueGrey,
          expandedColor: Colors.grey,
          expanded: Container(
            width: double.infinity,
            color: Colors.grey,
            padding: const EdgeInsets.all(16.0),
            child: const Text('Expanded content goes here'),
          ),
          title: const Text('Expandable IconListTile Button'),
          icon: Icons.account_circle,
        ),
        ExpandableListTileButton.customHeader(
          controller: ExpandableController(),
          backgroundColor: Colors.blueGrey,
          expandedColor: Colors.grey,
          expanded: Container(
            width: double.infinity,
            color: Colors.grey,
            padding: const EdgeInsets.all(16.0),
            child: const Text('Expanded content goes here'),
          ),
          customHeader: const CustomActionButton(
              margin: EdgeInsets.only(top: 10),
              backgroundColor: Colors.blueGrey,
              child: Center(child: Text('Expandable CustomHeader Button'))),
        ),
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
