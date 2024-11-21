import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class CustomSheetPage extends StatelessWidget {
  const CustomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedChildrenList(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Custom Sheet Example',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // Pulsante per aprire il foglio di conferma
        CustomActionButton(
          margin: const EdgeInsets.symmetric(vertical: 8),
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
              confirmButtonText: "Conferma",
              cancelButtonText: "Chiudi",
            ).show(context);
          },
          child: const Text('Open Confirm Sheet'),
        ),
        // Pulsante per aprire un foglio scrollabile
        CustomActionButton(
          margin: const EdgeInsets.symmetric(vertical: 8),
          onPressed: () {
            OpenCustomSheet.scrollableSheet(
              context,
              expand: true,
              initialChildSize: 0.5,
              minChildSize: 0.25,
              maxChildSize: 0.8,
              body: ({scrollController}) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: 50,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item $index'),
                  ),
                );
              },
              onClose: (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(value == true
                      ? 'Scrolled Action Confirmed'
                      : 'Scrolled Action Cancelled'),
                ));
              },
              backgroundColor: Colors.white,
              handleColor: Colors.grey,
            ).show(context);
          },
          child: const Text('Open Scrollable Sheet'),
        ),
        // Pulsante per aprire un foglio di conferma con un body grande ma non troppo
        CustomActionButton(
          margin: const EdgeInsets.symmetric(vertical: 8),
          onPressed: () {
            OpenCustomSheet.openConfirmSheet(
              context,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This is a large body content',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Additional Information:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ...List.generate(
                    5,
                    (index) => ListTile(
                      leading: const Icon(Icons.info),
                      title: Text('Detail $index'),
                    ),
                  ),
                ],
              ),
              onClose: (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(value == true ? 'Confirmed' : 'Cancelled'),
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
          child: const Text('Open Large Confirm Sheet'),
        ),
        // Pulsante per aprire un foglio con un modulo personalizzato
        CustomActionButton(
          margin: const EdgeInsets.symmetric(vertical: 8),
          onPressed: () {
            OpenCustomSheet(
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
              onClose: (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text(value == true ? 'Submitted' : 'Action Cancelled'),
                ));
              },
              backgroundColor: Colors.white,
              handleColor: Colors.grey,
              sheetPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              body: ({scrollController}) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    onPressed: () => Navigator.pop(context, true),
                    backgroundColor: Colors.green,
                    margin: EdgeInsets.zero,
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ).show(context);
          },
          child: const Text('Open Custom Form Sheet'),
        ),
      ],
    );
  }
}
