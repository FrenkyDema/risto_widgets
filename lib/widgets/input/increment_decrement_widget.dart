import 'dart:async';

import 'package:flutter/material.dart';

import '../buttons/custom_action_button.dart';

class IncrementDecrementWidget extends StatefulWidget {
  // Quantity properties
  final int quantity;
  final int? maxQuantity;
  final int? minValue;

  // Callback functions
  final ValueChanged<int>? onChanged;

  // Customization properties
  final Color? backgroundColor;
  final Color? iconColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? valuePadding;
  final TextStyle? quantityTextStyle;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? buttonMargin;
  final double? buttonWidth;
  final double? buttonHeight;

  // CustomActionButton parameters
  final Color? splashColor;
  final Color? borderColor;
  final InteractiveInkFeatureFactory? splashFactory;

  // Factory-specific properties
  final Widget? incrementIcon;
  final Widget? decrementIcon;

  // Button shape
  final OutlinedBorder? buttonShape;

  // Long-press settings
  final Duration longPressInterval;

  // Alignment
  final MainAxisAlignment? alignment;

  const IncrementDecrementWidget({
    super.key,
    required this.quantity,
    this.maxQuantity,
    this.minValue,
    this.onChanged,
    this.backgroundColor,
    this.iconColor,
    this.elevation,
    this.margin,
    this.valuePadding,
    this.quantityTextStyle,
    this.borderRadius,
    this.width,
    this.height,
    this.buttonPadding,
    this.buttonMargin,
    this.buttonWidth,
    this.buttonHeight,
    this.splashColor,
    this.borderColor,
    this.splashFactory,
    this.incrementIcon,
    this.decrementIcon,
    this.buttonShape,
    this.longPressInterval = const Duration(milliseconds: 100),
    this.alignment,
  });

  /// Factory constructor for a flat design.
  factory IncrementDecrementWidget.flat({
    required int quantity,
    int? maxQuantity,
    int? minValue,
    ValueChanged<int>? onChanged,
    Color? backgroundColor,
    Color? iconColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? valuePadding,
    EdgeInsetsGeometry? buttonMargin,
    EdgeInsetsGeometry? buttonPadding,
    TextStyle? quantityTextStyle,
    double? borderRadius,
    double? width,
    double? height,
    double? buttonWidth,
    double? buttonHeight,
    Color? splashColor,
    Color? borderColor,
    InteractiveInkFeatureFactory? splashFactory,
    Widget? incrementIcon,
    Widget? decrementIcon,
    Duration longPressInterval = const Duration(milliseconds: 100),
    MainAxisAlignment? alignment,
  }) {
    return IncrementDecrementWidget(
      quantity: quantity,
      maxQuantity: maxQuantity,
      minValue: minValue,
      onChanged: onChanged,
      backgroundColor: backgroundColor ?? Colors.transparent,
      iconColor: iconColor,
      elevation: 0.0,
      margin: margin,
      valuePadding: valuePadding,
      buttonMargin: buttonMargin,
      buttonPadding: buttonPadding,
      quantityTextStyle: quantityTextStyle,
      borderRadius: borderRadius ?? 10.0,
      width: width,
      height: height,
      buttonWidth: buttonWidth,
      buttonHeight: buttonHeight,
      splashColor: splashColor,
      borderColor: borderColor,
      splashFactory: splashFactory,
      incrementIcon: incrementIcon,
      decrementIcon: decrementIcon,
      longPressInterval: longPressInterval,
      alignment: alignment,
    );
  }

  /// Factory constructor for a raised design.
  factory IncrementDecrementWidget.raised({
    required int quantity,
    int? maxQuantity,
    int? minValue,
    ValueChanged<int>? onChanged,
    Color? backgroundColor,
    Color? iconColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? valuePadding,
    EdgeInsetsGeometry? buttonMargin,
    EdgeInsetsGeometry? buttonPadding,
    TextStyle? quantityTextStyle,
    double? borderRadius,
    double? width,
    double? height,
    double? buttonWidth,
    double? buttonHeight,
    Color? borderColor,
    Widget? incrementIcon,
    Widget? decrementIcon,
    Duration longPressInterval = const Duration(milliseconds: 100),
    MainAxisAlignment? alignment,
  }) {
    return IncrementDecrementWidget(
      quantity: quantity,
      maxQuantity: maxQuantity,
      minValue: minValue,
      onChanged: onChanged,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      elevation: elevation ?? 6.0,
      margin: margin,
      valuePadding: valuePadding,
      buttonMargin: buttonMargin,
      buttonPadding: buttonPadding,
      quantityTextStyle: quantityTextStyle,
      borderRadius: borderRadius ?? 10.0,
      width: width,
      height: height,
      buttonWidth: buttonWidth,
      buttonHeight: buttonHeight,
      borderColor: borderColor,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      incrementIcon: incrementIcon,
      decrementIcon: decrementIcon,
      longPressInterval: longPressInterval,
      alignment: alignment,
    );
  }

  /// Factory constructor for a minimalistic design.
  factory IncrementDecrementWidget.minimal({
    required int quantity,
    int? maxQuantity,
    int? minValue,
    ValueChanged<int>? onChanged,
    Color? iconColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? valuePadding,
    EdgeInsetsGeometry? buttonMargin,
    EdgeInsetsGeometry? buttonPadding,
    TextStyle? quantityTextStyle,
    double? width,
    double? height,
    double? buttonWidth,
    double? buttonHeight,
    Widget? incrementIcon,
    Widget? decrementIcon,
    Duration longPressInterval = const Duration(milliseconds: 100),
    MainAxisAlignment? alignment,
  }) {
    return IncrementDecrementWidget(
      quantity: quantity,
      maxQuantity: maxQuantity,
      minValue: minValue,
      onChanged: onChanged,
      backgroundColor: Colors.transparent,
      iconColor: iconColor,
      elevation: 0.0,
      margin: margin,
      valuePadding: valuePadding,
      buttonMargin: buttonMargin,
      buttonPadding: buttonPadding,
      quantityTextStyle: quantityTextStyle,
      width: width,
      height: height,
      buttonWidth: buttonWidth,
      buttonHeight: buttonHeight,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      incrementIcon: incrementIcon,
      decrementIcon: decrementIcon,
      longPressInterval: longPressInterval,
      alignment: alignment,
    );
  }

  /// Factory constructor for squared buttons with equal width and height and customizable border radius.
  factory IncrementDecrementWidget.squared({
    required int quantity,
    int? maxQuantity,
    int? minValue,
    ValueChanged<int>? onChanged,
    Color? backgroundColor,
    Color? iconColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? valuePadding,
    EdgeInsetsGeometry? buttonMargin,
    EdgeInsetsGeometry? buttonPadding,
    TextStyle? quantityTextStyle,
    double? width,
    double? height,
    double? buttonSize,
    double? borderRadius, // Allow specifying border radius
    Color? borderColor,
    Widget? incrementIcon,
    Widget? decrementIcon,
    Duration longPressInterval = const Duration(milliseconds: 100),
    MainAxisAlignment? alignment,
  }) {
    final double size = buttonSize ?? 50.0;
    final double effectiveBorderRadius = borderRadius ?? 10.0;
    return IncrementDecrementWidget(
      quantity: quantity,
      maxQuantity: maxQuantity,
      minValue: minValue,
      onChanged: onChanged,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      elevation: elevation ?? 0.0,
      margin: margin,
      valuePadding: valuePadding,
      buttonMargin: buttonMargin,
      buttonPadding: buttonPadding,
      quantityTextStyle: quantityTextStyle,
      width: width,
      height: height,
      buttonWidth: size,
      buttonHeight: size,
      borderColor: borderColor,
      borderRadius: effectiveBorderRadius,
      // Set the border radius
      splashColor: Colors.grey.withOpacity(0.2),
      incrementIcon: incrementIcon,
      decrementIcon: decrementIcon,
      buttonShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
      ),
      longPressInterval: longPressInterval,
      alignment: alignment ?? MainAxisAlignment.center,
    );
  }

  @override
  State<IncrementDecrementWidget> createState() =>
      _IncrementDecrementWidgetState();
}

class _IncrementDecrementWidgetState extends State<IncrementDecrementWidget> {
  late int _currentQuantity;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentQuantity = widget.quantity;
  }

  void _increment() {
    if (widget.maxQuantity == null || _currentQuantity < widget.maxQuantity!) {
      setState(() {
        _currentQuantity++;
      });
      widget.onChanged?.call(_currentQuantity);
    }
  }

  void _decrement() {
    if (widget.minValue == null || _currentQuantity > widget.minValue!) {
      setState(() {
        _currentQuantity--;
      });
      widget.onChanged?.call(_currentQuantity);
    }
  }

  void _startLongPress(bool isIncrement) {
    _timer = Timer.periodic(widget.longPressInterval, (_) {
      if (isIncrement) {
        _increment();
      } else {
        _decrement();
      }
    });
  }

  void _stopLongPress() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackgroundColor =
        widget.backgroundColor ?? Theme.of(context).cardColor;
    final EdgeInsetsGeometry valuePadding =
        widget.valuePadding ?? const EdgeInsets.symmetric(horizontal: 10);
    final EdgeInsetsGeometry buttonMargin =
        widget.buttonMargin ?? EdgeInsets.zero;
    final double? effectiveWidth = widget.width;
    final MainAxisAlignment effectiveAlignment =
        widget.alignment ?? MainAxisAlignment.spaceBetween;

    return SizedBox(
      width: effectiveWidth,
      child: Row(
        mainAxisAlignment: effectiveAlignment,
        children: <Widget>[
          _buildActionButton(
            context,
            widget.decrementIcon ?? const Icon(Icons.remove),
            onPressed:
                (widget.minValue == null || _currentQuantity > widget.minValue!)
                    ? _decrement
                    : null,
            isEnabled:
                widget.minValue == null || _currentQuantity > widget.minValue!,
            onLongPressStart: () => _startLongPress(false),
            onLongPressEnd: _stopLongPress,
            effectiveBackgroundColor: effectiveBackgroundColor,
            effectiveMargin: buttonMargin,
            effectiveWidth: widget.buttonWidth,
            effectiveHeight: widget.buttonHeight,
          ),
          _buildQuantityDisplay(context, valuePadding),
          _buildActionButton(
            context,
            widget.incrementIcon ?? const Icon(Icons.add),
            onPressed: (widget.maxQuantity == null ||
                    _currentQuantity < widget.maxQuantity!)
                ? _increment
                : null,
            isEnabled: widget.maxQuantity == null ||
                _currentQuantity < widget.maxQuantity!,
            onLongPressStart: () => _startLongPress(true),
            onLongPressEnd: _stopLongPress,
            effectiveBackgroundColor: effectiveBackgroundColor,
            effectiveMargin: buttonMargin,
            effectiveWidth: widget.buttonWidth,
            effectiveHeight: widget.buttonHeight,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    Widget icon, {
    required VoidCallback? onPressed,
    required bool isEnabled,
    required VoidCallback onLongPressStart,
    required VoidCallback onLongPressEnd,
    required Color effectiveBackgroundColor,
    required EdgeInsetsGeometry effectiveMargin,
    double? effectiveWidth,
    double? effectiveHeight,
  }) {
    final Color effectiveIconColor =
        _iconColor(context, isEnabled) ?? Theme.of(context).iconTheme.color!;


    Widget button = CustomActionButton.longPress(
      margin: effectiveMargin,
      width: effectiveWidth,
      height: effectiveHeight,
      backgroundColor: effectiveBackgroundColor,
      shape: widget.buttonShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
          ),
      elevation: widget.elevation ?? 0,
      padding: widget.buttonPadding,
      onPressed: onPressed,
      onLongPress: () {
        debugPrint("LONG PRESSED!");
        onPressed?.call();
      },
      child: IconTheme(
        data: IconThemeData(color: effectiveIconColor),
        child: icon,
      ),
    );

    if (effectiveWidth == null || effectiveHeight == null) {
      return Expanded(child: button);
    } else {
      return SizedBox(
        width: effectiveWidth,
        height: effectiveHeight,
        child: button,
      );
    }
  }

  Widget _buildQuantityDisplay(
    BuildContext context,
    EdgeInsetsGeometry padding,
  ) {
    return Expanded(
      flex: 0,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        child: Text(
          _currentQuantity.toString(),
          style: widget.quantityTextStyle ??
              Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

  Color? _iconColor(BuildContext context, bool isEnabled) {
    final Color defaultColor =
        widget.iconColor ?? Theme.of(context).iconTheme.color!;
    return isEnabled ? defaultColor : defaultColor.withOpacity(0.2);
  }
}
