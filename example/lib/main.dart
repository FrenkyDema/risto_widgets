import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

// Import the pages
import 'pages/action_button_page.dart';
import 'pages/custom_sheet_page.dart';
import 'pages/expandable_page.dart';
import 'pages/increment_decrement_page.dart';
import 'pages/list_tile_button_page.dart';

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
  final List<NavigationItem> _navigationItems = [];

  @override
  void initState() {
    super.initState();

    _navigationItems.addAll([
      NavigationItem(
        page: const IncrementDecrementPage(),
        icon: const Icon(Icons.home),
        label: 'Increment/Decrement',
      ),
      NavigationItem(
        page: const ActionButtonPage(),
        icon: const Icon(Icons.search),
        label: 'Action Buttons',
      ),
      NavigationItem(
        page: const ListTileButtonPage(),
        icon: const Icon(Icons.list),
        label: 'List Tile Buttons',
      ),
      NavigationItem(
        page: const ExpandablePage(),
        icon: const Icon(Icons.expand),
        label: 'Expandable',
      ),
      NavigationItem(
        page: const CustomSheetPage(),
        icon: const Icon(Icons.open_in_new),
        label: 'Custom Sheets',
      ),
    ]);
  }

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
        items: _navigationItems,
      ),
    );
  }
}
