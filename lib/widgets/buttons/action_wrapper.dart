import 'package:flutter/material.dart';

class ActionButtonWrapper extends StatelessWidget {
  final EdgeInsetsGeometry _margin;
  final double _height;
  final double _width;
  final Widget child;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  ActionButtonWrapper({
    super.key,
    EdgeInsetsGeometry? margin,
    double paddingValue = 16.0, // Default value
    double? height,
    double? width,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
  })  : _margin = margin ??
            EdgeInsets.only(
              bottom: 8,
              right: paddingValue,
              left: paddingValue,
            ),
        _height = height ?? 60,
        _width = width ?? double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
