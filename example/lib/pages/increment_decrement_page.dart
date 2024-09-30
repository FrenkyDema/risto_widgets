import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class IncrementDecrementPage extends StatefulWidget {
  const IncrementDecrementPage({super.key});

  @override
  State<IncrementDecrementPage> createState() => _IncrementDecrementPageState();
}

class _IncrementDecrementPageState extends State<IncrementDecrementPage> {
  int quantity1 = 1;
  int quantity2 = 5;
  int quantity3 = 8;
  int quantity4 = 2;

  @override
  Widget build(BuildContext context) {
    return PaddedChildrenList(
      children: [
        Text(
          'Increment/Decrement Widget',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),

        // Flat Example
        IncrementDecrementWidget.flat(
          quantity: quantity1,
          maxQuantity: 10,
          minValue: 1,
          onChanged: (newQuantity) {
            setState(() {
              quantity1 = newQuantity;
            });
            return newQuantity;
          },
          backgroundColor: Colors.grey[200],
          iconColor: Colors.blue,
        ),

        const SizedBox(height: 16),

        // Raised Example
        IncrementDecrementWidget.raised(
          quantity: quantity2,
          maxQuantity: 15,
          minValue: 0,
          onChanged: (newQuantity) {
            setState(() {
              quantity2 = newQuantity;
            });
            return newQuantity;
          },
          backgroundColor: Colors.lightGreen[100],
          iconColor: Colors.green,
        ),

        const SizedBox(height: 16),

        // Minimal Example
        IncrementDecrementWidget.minimal(
          quantity: quantity3,
          maxQuantity: 20,
          minValue: 5,
          onChanged: (newQuantity) {
            setState(() {
              quantity3 = newQuantity;
            });
            return newQuantity;
          },
          iconColor: Colors.red,
        ),

        const SizedBox(height: 16),

        // Squared Buttons Example
        IncrementDecrementWidget.squared(
          quantity: quantity4,
          alignment: MainAxisAlignment.center,
          onChanged: (newQuantity) {
            setState(() {
              quantity4 = newQuantity;
            });
            return newQuantity;
          },
          backgroundColor: Colors.orange[100],
          iconColor: Colors.orange,
          buttonSize: 60.0,
          borderRadius: 8.0,
          incrementIcon: const Icon(Icons.add),
          decrementIcon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
