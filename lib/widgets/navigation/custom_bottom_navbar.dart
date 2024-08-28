import 'package:flutter/material.dart';

class NavigationItem {
  final Widget page;
  final Icon icon;
  final String label;

  NavigationItem({
    required this.page,
    required this.icon,
    required this.label,
  });
}

class CustomBottomNavBar extends StatefulWidget {
  final List<NavigationItem> items;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? elevation;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.elevation = 8.0, // Default elevation
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void _onItemTapped(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.items.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: widget.backgroundColor ??
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor:
              widget.selectedItemColor ?? Theme.of(context).primaryColor,
          unselectedItemColor: widget.unselectedItemColor ??
              Theme.of(context).unselectedWidgetColor,
          elevation: widget.elevation,
          items: widget.items.map((item) {
            return BottomNavigationBarItem(
              icon: item.icon,
              label: item.label,
            );
          }).toList(),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
