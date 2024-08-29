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
  final EdgeInsetsGeometry? margin;

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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: CustomActionButton(
            margin: margin,
            backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
            elevation: elevation,
            onPressed: quantity > minValue ? onDecrement : null,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.remove,
                color: quantity > minValue
                    ? iconColor ?? Theme.of(context).iconTheme.color
                    : (iconColor ?? Theme.of(context).iconTheme.color)
                        ?.withOpacity(0.2),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              quantity.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        Expanded(
          child: CustomActionButton(
            margin: margin,
            backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
            elevation: elevation,
            onPressed: quantity < maxQuantity ? onIncrement : null,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.add,
                color: quantity < maxQuantity
                    ? iconColor ?? Theme.of(context).iconTheme.color
                    : (iconColor ?? Theme.of(context).iconTheme.color)
                        ?.withOpacity(0.2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
