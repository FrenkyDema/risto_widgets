import 'dart:async';

import 'package:flutter/material.dart';

enum ButtonType { elevated, flat, minimal, longPress }

class CustomActionButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  final Widget child;

  final ButtonType? buttonType;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final Color? splashColor;
  final Color? disabledBackgroundColor;
  final Color? disabledBorderColor;
  final Color? borderColor;

  final double? elevation;
  final double? borderRadius;
  final double? width;
  final double? height;

  final OutlinedBorder? shape;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final InteractiveInkFeatureFactory? splashFactory;

  const CustomActionButton({
    super.key,
    required this.child,
    this.buttonType,
    this.onPressed,
    this.onLongPress,
    this.backgroundColor,
    this.foregroundColor,
    this.shadowColor,
    this.splashColor,
    this.disabledBackgroundColor,
    this.disabledBorderColor,
    this.borderColor,
    this.elevation,
    this.borderRadius,
    this.width,
    this.height,
    this.shape,
    this.padding,
    this.margin,
    this.splashFactory,
  });

  factory CustomActionButton.elevated({
    required VoidCallback? onPressed,
    required Widget child,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? splashColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? borderColor,
    double elevation = 2.0,
    double borderRadius = 8.0,
    BorderSide? side,
    OutlinedBorder? shape,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    InteractiveInkFeatureFactory? splashFactory,
  }) {
    return CustomActionButton(
      buttonType: ButtonType.elevated,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      shadowColor: foregroundColor,
      splashColor: splashColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledBorderColor: disabledForegroundColor,
      borderColor: borderColor,
      elevation: elevation,
      borderRadius: borderRadius,
      shape: shape,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      splashFactory: splashFactory,
      child: child,
    );
  }

  factory CustomActionButton.flat({
    required VoidCallback? onPressed,
    required Widget child,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? splashColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? borderColor,
    double borderRadius = 8.0,
    BorderSide? side,
    OutlinedBorder? shape,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    InteractiveInkFeatureFactory? splashFactory,
  }) {
    return CustomActionButton(
      buttonType: ButtonType.flat,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      shadowColor: foregroundColor,
      splashColor: splashColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledBorderColor: disabledForegroundColor,
      borderColor: borderColor,
      borderRadius: borderRadius,
      shape: shape,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      splashFactory: splashFactory,
      child: child,
    );
  }

  factory CustomActionButton.minimal({
    required VoidCallback? onPressed,
    required Widget child,
    Color? disabledForegroundColor,
    Color? borderColor,
    double? width,
    double? height,
    OutlinedBorder? shape,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return CustomActionButton(
      buttonType: ButtonType.minimal,
      onPressed: onPressed,
      disabledBorderColor: disabledForegroundColor,
      borderColor: borderColor,
      width: width,
      height: height,
      shape: shape,
      padding: padding,
      margin: margin,
      child: child,
    );
  }

  factory CustomActionButton.longPress({
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    required Widget child,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? splashColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? borderColor,
    double elevation = 2.0,
    double borderRadius = 8.0,
    BorderSide? side,
    OutlinedBorder? shape,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    InteractiveInkFeatureFactory? splashFactory,
  }) {
    return CustomActionButton(
      buttonType: ButtonType.longPress,
      onPressed: onPressed,
      onLongPress: onLongPress,
      backgroundColor: backgroundColor,
      shadowColor: foregroundColor,
      splashColor: splashColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledBorderColor: disabledForegroundColor,
      borderColor: borderColor,
      elevation: elevation,
      borderRadius: borderRadius,
      shape: shape,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      splashFactory: splashFactory,
      child: child,
    );
  }

  @override
  State<CustomActionButton> createState() => _CustomActionButtonState();
}

class _CustomActionButtonState extends State<CustomActionButton> {
  Timer? _longPressTimer;

  void _handleLongPress() {
    if (widget.onLongPress != null) {
      _longPressTimer = Timer.periodic(
        const Duration(milliseconds: 100),
        (timer) {
          widget.onLongPress?.call();
        },
      );
    }
  }

  void _cancelLongPress() {
    _longPressTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onPressed == null && widget.buttonType != ButtonType.longPress) {
      return _buildDisabledButton(context);
    }

    switch (widget.buttonType) {
      case ButtonType.minimal:
        return _buildMinimalButton(context);
      case ButtonType.longPress:
        return _buildLongPressButton(context);
      case ButtonType.elevated:
        return _buildElevatedButton(context);
      case ButtonType.flat:
      default:
        return _buildFlatButton(context);
    }
  }

  Widget _buildDisabledButton(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      overlayColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: widget.shadowColor ?? Colors.black,
      foregroundColor: widget.foregroundColor ?? Colors.transparent,
      backgroundColor: widget.disabledBackgroundColor ??
          widget.backgroundColor ??
          Theme.of(context).primaryColor,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            side: (widget.disabledBorderColor ?? widget.borderColor) != null
                ? BorderSide(
                    color: widget.disabledBorderColor ??
                        widget.borderColor ??
                        Colors.transparent,
                    width: 1)
                : BorderSide.none,
          ),
      elevation: widget.elevation,
    );

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: AbsorbPointer(
        absorbing: true,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: () {},
          child: widget.child,
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: widget.shadowColor ?? Colors.black,
      backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            side: widget.borderColor != null
                ? BorderSide(color: widget.borderColor!, width: 1)
                : BorderSide.none,
          ),
      elevation: widget.elevation ?? 2.0,
      overlayColor: widget.splashColor ?? Colors.transparent,
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
      foregroundColor: widget.shadowColor ?? Colors.white,
      backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
      overlayColor: widget.splashColor ?? Colors.grey.withOpacity(0.2),
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            side: widget.borderColor != null
                ? BorderSide(color: widget.borderColor!, width: 1)
                : BorderSide.none,
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
      side: widget.borderColor != null
          ? BorderSide(color: widget.borderColor!, width: 1)
          : BorderSide.none,
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
      foregroundColor: widget.shadowColor ?? Colors.white,
      backgroundColor: widget.backgroundColor ?? Theme.of(context).primaryColor,
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            side: widget.borderColor != null
                ? BorderSide(color: widget.borderColor!, width: 1)
                : BorderSide.none,
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
