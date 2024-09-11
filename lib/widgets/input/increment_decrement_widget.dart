import 'package:flutter/material.dart';

import '../buttons/custom_action_button.dart';

class IncrementDecrementWidget extends StatelessWidget {
  final int quantity;
  final int maxQuantity;
  final int minValue;
  final void Function() onIncrement;
  final void Function() onDecrement;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? elevation;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final TextStyle? quantityTextStyle;

  const IncrementDecrementWidget({
    super.key,
    required this.quantity,
    required this.maxQuantity,
    required this.minValue,
    required this.onIncrement,
    required this.onDecrement,
    this.backgroundColor,
    this.iconColor,
    this.elevation = 0.0,
    this.margin = const EdgeInsets.all(5),
    this.padding = const EdgeInsets.symmetric(horizontal: 5),
    this.quantityTextStyle,
  });

  // Custom constructor for a flat design
  factory IncrementDecrementWidget.flat({
    required int quantity,
    required int maxQuantity,
    required int minValue,
    required void Function() onIncrement,
    required void Function() onDecrement,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return IncrementDecrementWidget(
      quantity: quantity,
      maxQuantity: maxQuantity,
      minValue: minValue,
      onIncrement: onIncrement,
      onDecrement: onDecrement,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      elevation: 0.0,
      // Flat design, no elevation
      margin: const EdgeInsets.all(8.0),
    );
  }

  // Custom constructor for a raised design with elevation
  factory IncrementDecrementWidget.raised({
    required int quantity,
    required int maxQuantity,
    required int minValue,
    required void Function() onIncrement,
    required void Function() onDecrement,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return IncrementDecrementWidget(
      quantity: quantity,
      maxQuantity: maxQuantity,
      minValue: minValue,
      onIncrement: onIncrement,
      onDecrement: onDecrement,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      elevation: 6.0,
      // Raised with elevation
      margin: const EdgeInsets.all(8.0),
    );
  }

  // Custom constructor for a minimalistic design
  factory IncrementDecrementWidget.minimal({
    required int quantity,
    required int maxQuantity,
    required int minValue,
    required void Function() onIncrement,
    required void Function() onDecrement,
    Color? iconColor,
  }) {
    return IncrementDecrementWidget(
      quantity: quantity,
      maxQuantity: maxQuantity,
      minValue: minValue,
      onIncrement: onIncrement,
      onDecrement: onDecrement,
      backgroundColor: Colors.transparent,
      // Minimalist design
      iconColor: iconColor,
      elevation: 0.0,
      // No elevation by default
      margin: EdgeInsets.zero, // No margin for minimal design
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildActionButton(
          context,
          Icons.remove,
          onPressed: quantity > minValue ? onDecrement : null,
          isEnabled: quantity > minValue,
        ),
        _buildQuantityDisplay(context),
        _buildActionButton(
          context,
          Icons.add,
          onPressed: quantity < maxQuantity ? onIncrement : null,
          isEnabled: quantity < maxQuantity,
        ),
      ],
    );
  }

  /// Builds an increment or decrement button using CustomActionButton.
  Widget _buildActionButton(BuildContext context, IconData icon,
      {required VoidCallback? onPressed, required bool isEnabled}) {
    return Expanded(
      child: CustomActionButton(
        margin: margin,
        backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
        onPressed: onPressed,
        child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.scaleDown,
          child: Icon(
            icon,
            color: _iconColor(context, isEnabled),
          ),
        ),
      ),
    );
  }

  /// Displays the current quantity between the increment and decrement buttons.
  Widget _buildQuantityDisplay(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        child: Text(
          quantity.toString(),
          style:
              quantityTextStyle ?? Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }

  Color _iconColor(BuildContext context, bool isEnabled) {
    final Color defaultColor = iconColor ?? Theme.of(context).iconTheme.color!;
    return isEnabled ? defaultColor : defaultColor.withOpacity(0.2);
  }
}
