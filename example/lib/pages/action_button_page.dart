import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class ActionButtonPage extends StatefulWidget {
  const ActionButtonPage({super.key});

  @override
  State<ActionButtonPage> createState() => _ActionButtonPageState();
}

class _ActionButtonPageState extends State<ActionButtonPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return PaddedChildrenList(
      children: [
        Text(
          'Custom Action Buttons',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        // Elevated Button Example
        CustomActionButton.elevated(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4.0,
          borderRadius: 8.0,
          child: Text('Elevated Button ($counter)'),
        ),
        const SizedBox(height: 16),
        // Flat Button Example
        CustomActionButton.flat(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          backgroundColor: Colors.green,
          splashColor: Colors.white.withOpacity(0.2),
          borderRadius: 8.0,
          child: Text('Flat Button ($counter)',
              style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 16),
        // Minimal Button Example
        CustomActionButton.minimal(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Text('Minimal Button ($counter)',
              style: const TextStyle(color: Colors.black)),
        ),
        const SizedBox(height: 16),
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
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 4.0,
          borderRadius: 8.0,
          child: Text('Long Press Button ($counter)'),
        ),
      ],
    );
  }
}
