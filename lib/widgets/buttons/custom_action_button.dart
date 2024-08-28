import 'package:flutter/material.dart';

class ActionButtonWrapper extends StatelessWidget {
  final EdgeInsetsGeometry _margin;
  final double _height;
  final double _width;
  final Widget child;

  ActionButtonWrapper({
    super.key,
    EdgeInsetsGeometry? margin,
    double paddingValue = 16.0, // Default value
    double? height,
    double? width,
    required this.child,
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
      child: child,
    );
  }
}

class CustomActionButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? disabledForegroundColor;
  final void Function()? onPressed;
  final Widget? child;

  final double? elevation;
  final double? borderRadius;

  // wrapper
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;

  const CustomActionButton({
    super.key,
    this.margin,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.disabledForegroundColor,
    this.elevation,
    this.onPressed,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButtonWrapper(
      width: width,
      height: height,
      margin: margin,
      child: onPressed != null
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    backgroundColor ?? Theme.of(context).primaryColor,
                splashFactory: Theme.of(context).splashFactory,
                backgroundColor:
                    backgroundColor ?? Theme.of(context).primaryColor,
                padding: EdgeInsets.zero,
                side: BorderSide(color: borderColor ?? Colors.transparent),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius ?? 10))),
                elevation: elevation,
              ),
              onPressed: onPressed,
              child: child,
            )
          : CustomActionDisable(
              backgroundColor:
                  backgroundColor ?? Theme.of(context).disabledColor,
              borderColor: borderColor ?? Colors.transparent,
              child: child,
            ),
    );
  }
}

class CustomActionDisable extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Widget? child;

  const CustomActionDisable({
    super.key,
    required this.backgroundColor,
    this.borderColor = Colors.transparent,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: backgroundColor,
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
      ),
      child: child,
    );
  }
}

class CustomIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final MainAxisAlignment axisAlignment;
  final TextStyle? textStyle;

  const CustomIconText({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.axisAlignment = MainAxisAlignment.center,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: axisAlignment,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              size: textStyle?.fontSize ?? Theme.of(context).iconTheme.size,
              color: color ?? Theme.of(context).iconTheme.color,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: textStyle ??
                  Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: color ??
                          Theme.of(context).textTheme.bodyLarge!.color),
            ),
          ),
        ],
      ),
    );
  }
}
