import 'package:flutter/material.dart';

import 'action_wrapper.dart';

class CustomActionButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? foregroundColor;
  final Color? splashColor; // Added splash color
  final InteractiveInkFeatureFactory? splashFactory;
  final double? elevation;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final BorderSide? side;
  final ShapeBorder? shape;

  final void Function()? onPressed;
  final Widget? child;
  final double? size; // For circular button
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
    this.foregroundColor,
    this.splashColor,
    this.splashFactory,
    this.elevation,
    this.onPressed,
    this.borderRadius,
    this.padding,
    this.side,
    this.shape,
    required this.child,
    this.size, // for circular button
  });

  // Factory for a flat button with splash effect but no elevation
  factory CustomActionButton.flat({
    required void Function()? onPressed,
    required Widget child,
    Color? backgroundColor,
    Color? splashColor,
    Color? borderColor,
    double borderRadius = 10.0,
    InteractiveInkFeatureFactory? splashFactory,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    return CustomActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? Colors.transparent,
      splashFactory: splashFactory ?? InkRipple.splashFactory,
      splashColor: splashColor ?? Colors.grey.withOpacity(0.2),
      borderColor: borderColor ?? Colors.transparent,
      borderRadius: borderRadius,
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      child: child,
    );
  }

  // Factory for a raised button with elevation but no splash effect
  factory CustomActionButton.raised({
    required void Function()? onPressed,
    required Widget child,
    Color? backgroundColor,
    Color? borderColor,
    double borderRadius = 10.0,
    double elevation = 6.0,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
  }) {
    return CustomActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      elevation: elevation,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      borderColor: borderColor,
      borderRadius: borderRadius,
      width: width,
      height: height,
      margin: margin,
      child: child,
    );
  }

  // Factory for a minimal button with no elevation or splash
  factory CustomActionButton.minimal({
    required void Function()? onPressed,
    required Widget child,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
  }) {
    return CustomActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      width: width,
      height: height,
      margin: margin,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isCircular = size != null && borderRadius == size! / 2;

    return ActionButtonWrapper(
      width: width,
      height: height,
      margin: margin,
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      backgroundColor: backgroundColor,
      child: onPressed != null
          ? ElevatedButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(
                  foregroundColor ?? Theme.of(context).primaryColor,
                ),
                backgroundColor: WidgetStateProperty.all(
                  backgroundColor ?? Theme.of(context).primaryColor,
                ),
                padding: WidgetStateProperty.all(
                  padding ?? EdgeInsets.zero,
                ),
                side: WidgetStateProperty.all(
                  side ?? BorderSide(color: borderColor ?? Colors.transparent),
                ),
                shape: WidgetStateProperty.all(
                  shape is OutlinedBorder
                      ? shape as OutlinedBorder
                      : isCircular
                          ? const CircleBorder()
                          : RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(borderRadius ?? 10),
                              ),
                            ),
                ),
                splashFactory: splashFactory,
                surfaceTintColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      return splashColor; // Splash effect only for flat
                    }
                    return null;
                  },
                ),
                overlayColor: onPressed != null && elevation == null
                    ? WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) {
                            return splashColor; // Splash effect only for flat
                          }
                          return null;
                        },
                      )
                    : null,
                // No overlay for raised and minimal
                elevation: elevation != null
                    ? WidgetStateProperty.resolveWith(
                        (states) {
                          switch (states.firstOrNull) {
                            case WidgetState.pressed:
                              return elevation! + 6;

                            default:
                              return elevation;
                          }
                        },
                      ) // Elevation for raised
                    : WidgetStateProperty.all(
                        0), // No elevation for flat/minimal
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
