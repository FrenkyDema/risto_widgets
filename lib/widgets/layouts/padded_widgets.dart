import 'package:flutter/cupertino.dart';

class PaddingWrapper extends StatelessWidget {
  final Widget child;
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;
  final double defaultPadding;

  const PaddingWrapper({
    super.key,
    this.defaultPadding = 16.0, // Default padding value
    this.left,
    this.right,
    this.bottom,
    this.top,
    required this.child,
  });

  factory PaddingWrapper.symmetric({
    double? vertical,
    double? horizontal,
    double defaultPadding = 16.0,
    required Widget child,
  }) {
    return PaddingWrapper(
      left: horizontal,
      right: horizontal,
      top: vertical,
      bottom: vertical,
      defaultPadding: defaultPadding,
      child: child,
    );
  }

  factory PaddingWrapper.all({
    double padding = 16.0,
    required Widget child,
  }) {
    return PaddingWrapper(
      left: padding,
      right: padding,
      top: padding,
      bottom: padding,
      defaultPadding: padding,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? defaultPadding,
        right: right ?? defaultPadding,
        bottom: bottom ?? 0,
        top: top ?? 0,
      ),
      child: child,
    );
  }
}

class PaddedChildrenList extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double defaultPadding;

  const PaddedChildrenList({
    super.key,
    required this.children,
    this.padding,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.defaultPadding = 16.0, // Default padding value
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding ??
          EdgeInsets.only(
            left: defaultPadding,
            right: defaultPadding,
            bottom: defaultPadding,
          ),
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
