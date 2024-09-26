import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class ExpandablePage extends StatelessWidget {
  const ExpandablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedChildrenList(
      children: [
        Text(
          'Expandable List Tile Button',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),

        // Standard Expandable List Tile Button
        ExpandableListTileButton.listTile(
          backgroundColor: Colors.blueGrey[600],
          expandedColor: Colors.blue[300],
          expanded: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: const Text('Expanded content goes here'),
          ),
          title: const Text(
            'Expandable ListTile Button',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            'Subtitle Text',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        const SizedBox(height: 20),

        // Icon List Tile Button with Expandable
        ExpandableListTileButton.iconListTile(
          backgroundColor: Colors.blueGrey[600],
          expandedColor: Colors.blue[300],
          expanded: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: const Text('Expanded content goes here'),
          ),
          title: const Text(
            'Expandable IconListTile Button',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            'Subtitle Text',
            style: TextStyle(color: Colors.white70),
          ),
          icon: Icons.account_circle,
          iconColor: Colors.white,
          sizeFactor: 2,
        ),
        const SizedBox(height: 20),

        // Custom Header with Expandable Content
        ExpandableListTileButton.custom(
          backgroundColor: Colors.blueGrey[600],
          expandedColor: Colors.blue[300],
          expanded: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: const Text('Expanded content goes here'),
          ),
          customHeader: (tapAction, isExpanded) => CustomActionButton(
            backgroundColor: Colors.blueGrey[600],
            margin: EdgeInsets.zero,
            onPressed: () => tapAction.call(),
            child: const Center(
              child: Text(
                'Expandable CustomHeader Button',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
