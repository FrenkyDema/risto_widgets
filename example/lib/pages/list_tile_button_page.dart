import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class ListTileButtonPage extends StatelessWidget {
  const ListTileButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedChildrenList(
      children: [
        Text(
          'List Tile Button Examples',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),

        // ListTileButton with Elevation
        ListTileButton(
          body: const Text('List Tile Button with Elevation'),
          subtitle: const Text('Subtitle Text'),
          onPressed: () {},
          backgroundColor: Colors.white,
          borderColor: Colors.blue,
          elevation: 4.0,
          trailing: const Icon(Icons.arrow_forward),
          minHeight: 90,
        ),
        const SizedBox(height: 16),

        // ListTileButton without Elevation
        ListTileButton(
          body: const Text('List Tile Button without Elevation'),
          subtitle: const Text('Subtitle Text'),
          onPressed: () {},
          backgroundColor: Colors.white,
          borderColor: Colors.blue,
          trailing: const Icon(Icons.arrow_forward),
        ),
        const SizedBox(height: 16),

        // IconListTileButton with Elevation
        IconListTileButton(
          title: const Text('Icon List Tile with Elevation'),
          icon: Icons.star,
          subtitle: const Text('Subtitle Text'),
          onPressed: () {},
          backgroundColor: Colors.white,
          borderColor: Colors.purple,
          iconColor: Colors.purple,
          elevation: 4.0,
          trailing: const Icon(Icons.arrow_forward),
        ),
        const SizedBox(height: 16),

        // IconListTileButton without Elevation
        IconListTileButton(
            title: const Text('Icon List Tile without Elevation'),
            icon: Icons.star_border,
            subtitle: const Text('Subtitle Text'),
            onPressed: () {},
            backgroundColor: Colors.white,
            borderColor: Colors.purple,
            iconColor: Colors.purple,
            trailing: const Icon(Icons.arrow_forward),
            sizeFactor: 3),
        const SizedBox(height: 20),

        Text(
          'Double List Tile Buttons',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),

        // Double List Tile Buttons with Elevation
        DoubleListTileButtons(
          firstButton: ListTileButton(
            body: const Center(child: Text('First Button with Elevation')),
            onPressed: () {},
            backgroundColor: Colors.red,
            elevation: 2.0,
          ),
          secondButton: ListTileButton(
            body: const Center(child: Text('Second Button with Elevation')),
            onPressed: () {},
            backgroundColor: Colors.green,
            elevation: 2.0,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          space: 16.0,
        ),
        const SizedBox(height: 16),

        // Double List Tile Buttons without Elevation
        DoubleListTileButtons(
          firstButton: ListTileButton(
            body: const Center(child: Text('First Button without Elevation')),
            onPressed: () {},
            backgroundColor: Colors.red,
          ),
          secondButton: ListTileButton(
            body: const Center(child: Text('Second Button without Elevation')),
            onPressed: () {},
            backgroundColor: Colors.green,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          space: 16.0,
        ),
      ],
    );
  }
}
