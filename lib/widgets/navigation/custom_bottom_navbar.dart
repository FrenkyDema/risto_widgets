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
  final BottomNavigationBarType? type;
  final double? selectedFontSize;
  final double? unselectedFontSize;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;
  final EdgeInsetsGeometry? itemPadding;
  final EdgeInsetsGeometry? navbarPadding;
  final EdgeInsetsGeometry? margin;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.elevation,
    this.type,
    this.selectedFontSize,
    this.unselectedFontSize,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.itemPadding,
    this.navbarPadding,
    this.margin,
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
    final bottomNavBarTheme = Theme.of(context).bottomNavigationBarTheme;

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.items.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: Card(
        margin: widget.margin ?? const EdgeInsets.all(0),
        elevation: widget.elevation ?? bottomNavBarTheme.elevation ?? 8.0,
        color: widget.backgroundColor ??
            bottomNavBarTheme.backgroundColor ??
            Theme.of(context).colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          clipBehavior: Clip.hardEdge,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: widget.type ??
                bottomNavBarTheme.type ??
                BottomNavigationBarType.shifting,
            selectedItemColor: widget.selectedItemColor ??
                bottomNavBarTheme.selectedItemColor ??
                Theme.of(context).colorScheme.primary,
            unselectedItemColor: widget.unselectedItemColor ??
                bottomNavBarTheme.unselectedItemColor ??
                Theme.of(context).unselectedWidgetColor,
            selectedFontSize: widget.selectedFontSize ??
                bottomNavBarTheme.selectedLabelStyle?.fontSize ??
                14.0,
            unselectedFontSize: widget.unselectedFontSize ??
                bottomNavBarTheme.unselectedLabelStyle?.fontSize ??
                12.0,
            showSelectedLabels: widget.showSelectedLabels ??
                bottomNavBarTheme.showSelectedLabels ??
                true,
            showUnselectedLabels: widget.showUnselectedLabels ??
                bottomNavBarTheme.showUnselectedLabels ??
                true,
            selectedIconTheme: widget.selectedIconTheme ??
                bottomNavBarTheme.selectedIconTheme ??
                const IconThemeData(size: 24.0),
            unselectedIconTheme: widget.unselectedIconTheme ??
                bottomNavBarTheme.unselectedIconTheme ??
                const IconThemeData(size: 20.0),
            items: widget.items.map((item) {
              return BottomNavigationBarItem(
                icon: Container(
                  padding: widget.itemPadding ?? EdgeInsets.zero,
                  alignment: Alignment.center,
                  child: item.icon,
                ),
                label: item.label,
              );
            }).toList(),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
