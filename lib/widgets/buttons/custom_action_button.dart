import 'dart:async';

import 'package:flutter/material.dart';

enum ButtonType { elevated, flat, minimal, longPress }

class CustomActionButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;

  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final double? borderRadius;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;

  final ButtonType? buttonType;

  const CustomActionButton({
    super.key,
    required this.child,
    this.buttonType,
    this.onPressed,
    this.onLongPress,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.borderRadius,
    this.side,
    this.shape,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.splashColor,
    this.splashFactory,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
  });

  factory CustomActionButton.elevated({
    required VoidCallback? onPressed,
    required Widget child,
    Color? backgroundColor,
    Color? foregroundColor,
    double elevation = 2.0,
    double borderRadius = 8.0,
    BorderSide? side,
    OutlinedBorder? shape,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
  }) {
    return CustomActionButton(
      buttonType: ButtonType.elevated,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      side: side,
      shape: shape,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      splashColor: splashColor,
      splashFactory: splashFactory,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      child: child,
    );
  }

  factory CustomActionButton.flat({
    required VoidCallback? onPressed,
    required Widget child,
    Color? backgroundColor,
    Color? foregroundColor,
    double borderRadius = 8.0,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    BorderSide? side,
    OutlinedBorder? shape,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
  }) {
    return CustomActionButton(
      buttonType: ButtonType.flat,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderRadius: borderRadius,
      splashColor: splashColor,
      splashFactory: splashFactory,
      side: side,
      shape: shape,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      child: child,
    );
  }

  factory CustomActionButton.minimal({
    required VoidCallback? onPressed,
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    OutlinedBorder? shape,
    Color? disabledForegroundColor,
  }) {
    return CustomActionButton(
      buttonType: ButtonType.minimal,
      onPressed: onPressed,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      shape: shape,
      disabledForegroundColor: disabledForegroundColor,
      child: child,
    );
  }

  factory CustomActionButton.longPress({
    required VoidCallback? onPressed,
    required VoidCallback onLongPress,
    required Widget child,
    Color? backgroundColor,
    Color? foregroundColor,
    double elevation = 2.0,
    double borderRadius = 8.0,
    BorderSide? side,
    OutlinedBorder? shape,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
  }) {
    return CustomActionButton(
      buttonType: ButtonType.longPress,
      onPressed: onPressed,
      onLongPress: onLongPress,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      side: side,
      shape: shape,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      splashColor: splashColor,
      splashFactory: splashFactory,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      child: child,
    );
  }

  @override
  State<CustomActionButton> createState() => _CustomActionButtonState();
}

class _CustomActionButtonState extends State<CustomActionButton> {
  Timer? _longPressTimer;

  void _handleLongPress() {
    _longPressTimer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        widget.onLongPress?.call();
      },
    );
  }

  void _cancelLongPress() {
    _longPressTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onPressed == null) {
      return _buildDisabledButton(context);
    }

    switch (widget.buttonType) {
      case ButtonType.minimal:
        return _buildMinimalButton(context);
      case ButtonType.flat:
        return _buildFlatButton(context);
      case ButtonType.longPress:
        return _buildLongPressButton(context);
      case ButtonType.elevated:
      default:
        return _buildElevatedButton(context);
    }
  }

  Widget _buildDisabledButton(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: widget.disabledForegroundColor ?? Colors.grey.shade600,
      backgroundColor: widget.disabledBackgroundColor ?? Colors.grey.shade400,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            side: widget.side ?? BorderSide.none,
          ),
      elevation: 0.0,
    );

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: null,
        child: widget.child,
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: widget.foregroundColor ?? Colors.white,
      backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            side: widget.side ?? BorderSide.none,
          ),
      elevation: widget.elevation ?? 2.0,
    ).copyWith(
      overlayColor: widget.splashColor != null
          ? WidgetStateProperty.all(widget.splashColor)
          : null,
      splashFactory: widget.splashFactory,
    );

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }

  Widget _buildFlatButton(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      foregroundColor: widget.foregroundColor ?? Theme.of(context).primaryColor,
      backgroundColor: widget.backgroundColor ?? Colors.transparent,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            side: widget.side ?? BorderSide.none,
          ),
    ).copyWith(
      overlayColor: WidgetStateProperty.all(
        widget.splashColor ?? Colors.grey.withOpacity(0.2),
      ),
      splashFactory: widget.splashFactory ?? InkRipple.splashFactory,
    );

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: TextButton(
        style: buttonStyle,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }

  Widget _buildMinimalButton(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      foregroundColor: Colors.black,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: widget.shape ?? const RoundedRectangleBorder(),
      backgroundColor: Colors.transparent,
    ).copyWith(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
    );

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: TextButton(
        style: buttonStyle,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }

  Widget _buildLongPressButton(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: widget.foregroundColor ?? Colors.white,
      backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            side: widget.side ?? BorderSide.none,
          ),
      elevation: widget.elevation ?? 2.0,
    ).copyWith(
      overlayColor: widget.splashColor != null
          ? WidgetStateProperty.all(widget.splashColor)
          : null,
      splashFactory: widget.splashFactory,
    );

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onTap: widget.onPressed,
        onLongPressStart: (_) => _handleLongPress(),
        onLongPressEnd: (_) => _cancelLongPress(),
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: widget.onPressed,
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _longPressTimer?.cancel();
    super.dispose();
  }
}

class CustomIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final MainAxisAlignment mainAxisAlignment;
  final TextStyle? textStyle;
  final double? iconSize;
  final double spacing;

  const CustomIconText({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.textStyle,
    this.iconSize,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveTextStyle = textStyle ??
        Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color ?? Theme.of(context).textTheme.bodyMedium!.color);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize ?? effectiveTextStyle.fontSize,
          color: color ?? Theme.of(context).iconTheme.color,
        ),
        SizedBox(width: spacing),
        Flexible(
          child: Text(
            text,
            style: effectiveTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
