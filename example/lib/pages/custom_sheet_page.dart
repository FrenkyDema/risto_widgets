import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class CustomSheetPage extends StatelessWidget {
  const CustomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedChildrenList(
      children: [
        Text(
          'Custom Sheet Example',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),

        ElevatedButton(
          onPressed: () {
            OpenCustomSheet.openConfirmSheet(
              context,
              body: const Text('Are you sure you want to proceed?'),
              onClose: (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      value == true ? 'Action Confirmed' : 'Action Cancelled'),
                ));
              },
              backgroundColor: Colors.white,
              handleColor: Colors.grey,
              firstButtonColor: Colors.red,
              secondButtonColor: Colors.green,
              firstButtonTextColor: Colors.white,
              secondButtonTextColor: Colors.white,
              buttonSpacing: 8.0,
            ).show(context);
          },
          child: const Text('Open Confirm Sheet'),
        ),
        const SizedBox(height: 16),

        ElevatedButton(
          onPressed: () {
            OpenCustomSheet.scrollableSheet(
              context,
              initialChildSize: 0.5,
              minChildSize: 0.25,
              maxChildSize: 1.0,
              body: ({scrollController}) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: 50,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item $index'),
                  ),
                );
              },
            ).show(context);
          },
          child: const Text('Open Scrollable Sheet'),
        ),
        const SizedBox(height: 16),

        ElevatedButton(
          onPressed: () {
            OpenCustomSheet(
              scrollable: false,
              expand: false,
              initialChildSize: 0.7,
              minChildSize: 0.5,
              maxChildSize: 0.8,
              barrierColor: Colors.black.withOpacity(0.5),
              body: ({scrollController}) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 32,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter Details',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomActionButton.flat(
                      onPressed: () => Navigator.pop(context, 'Submitted'),
                      backgroundColor: Colors.green,
                      margin: EdgeInsets.zero,
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ).show(context);
          },
          child: const Text('Open Custom Form Sheet'),
        ),
      ],
    );
  }
}