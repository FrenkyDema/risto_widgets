import 'package:flutter/material.dart';

/// A customizable wrapper that applies padding to its child widget.
class PaddingWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const PaddingWrapper({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0), // Default padding value
  });

  /// Factory constructor for applying the same padding to all sides.
  factory PaddingWrapper.all({
    required Widget child,
    double padding = 16.0,
  }) {
    return PaddingWrapper(
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }

  /// Factory constructor for symmetric padding (vertical and horizontal).
  factory PaddingWrapper.symmetric({
    required Widget child,
    double vertical = 16.0,
    double horizontal = 16.0,
  }) {
    return PaddingWrapper(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: child,
    );
  }

  /// Factory constructor for specific padding on each side.
  factory PaddingWrapper.only({
    required Widget child,
    double left = 16.0,
    double right = 16.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return PaddingWrapper(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: child,
    );
  }

  /// Factory constructor for horizontal padding only.
  factory PaddingWrapper.horizontal({
    required Widget child,
    double horizontal = 16.0,
  }) {
    return PaddingWrapper(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: child,
    );
  }

  /// Factory constructor for vertical padding only.
  factory PaddingWrapper.vertical({
    required Widget child,
    double vertical = 16.0,
  }) {
    return PaddingWrapper(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}

/// A customizable list with padded children, providing default or custom padding.
class PaddedChildrenList extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const PaddedChildrenList({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  /// Factory constructor for default padding (all sides equal).
  factory PaddedChildrenList.all({
    required List<Widget> children,
    double padding = 16.0,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return PaddedChildrenList(
      padding: EdgeInsets.all(padding),
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }

  /// Factory constructor for symmetric padding (vertical and horizontal).
  factory PaddedChildrenList.symmetric({
    required List<Widget> children,
    double vertical = 16.0,
    double horizontal = 16.0,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return PaddedChildrenList(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }

  /// Factory constructor for custom padding (only specific sides).
  factory PaddedChildrenList.only({
    required List<Widget> children,
    double left = 16.0,
    double right = 16.0,
    double top = 0.0,
    double bottom = 16.0, // Ensure the bottom defaults to 16.0
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  }) {
    return PaddedChildrenList(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
