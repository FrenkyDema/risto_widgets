import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart'; // Ensure correct path

class ActionButtonPage extends StatefulWidget {
  const ActionButtonPage({super.key});

  @override
  State<ActionButtonPage> createState() => _ActionButtonPageState();
}

class _ActionButtonPageState extends State<ActionButtonPage> {
  int counter = 0;

  /// Simulates an asynchronous operation, such as a network request.
  Future<void> _incrementCounterAsync() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PaddedChildrenList(
      children: [
        Text(
          'Custom Action Buttons',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // Elevated Button Example
        CustomActionButton.elevated(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          margin: const EdgeInsets.symmetric(vertical: 8),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4.0,
          borderRadius: 8.0,
          child: Text('Elevated Button ($counter)'),
        ),
        // Flat Button Example
        CustomActionButton.flat(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          margin: const EdgeInsets.symmetric(vertical: 8),
          backgroundColor: Colors.green,
          splashColor: Colors.white.withOpacity(0.2),
          borderRadius: 8.0,
          child: Text('Flat Button ($counter)',
              style: const TextStyle(color: Colors.white)),
        ),
        // Minimal Button Example
        CustomActionButton.minimal(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Text('Minimal Button ($counter)',
              style: const TextStyle(color: Colors.black)),
        ),
        // Long Press Button Example
        CustomActionButton.longPress(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          onLongPress: () {
            setState(() {
              counter += 2;
            });
          },
          margin: const EdgeInsets.symmetric(vertical: 8),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 4.0,
          borderRadius: 8.0,
          child: Text('Long Press Button ($counter)'),
        ),

        // Disabled Press Button Example
        CustomActionButton(
          elevation: 4.0,
          onPressed: null,
          margin: const EdgeInsets.symmetric(vertical: 8),
          backgroundColor: Colors.grey,
          borderRadius: 8.0,
          // Disabled
          child: Text(
            'Disabled Press Button ($counter)',
            style: const TextStyle(color: Colors.white),
          ),
        ),

        const SizedBox(height: 16),

        Text(
          'Single Press Button',
          style: Theme.of(context).textTheme.titleLarge,
        ),

        // SinglePressButton Example
        SinglePressButton(
          onPressed: _incrementCounterAsync,
          margin: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.purple,
          disabledColor: Colors.purple.shade200,
          borderRadius: 8.0,
          elevation: 4.0,
          showLoadingIndicator: true,
          loadingIndicatorColor: Colors.white,
          child: Text('Single Press Button ($counter)'),
        ),
      ],
    );
  }
}
