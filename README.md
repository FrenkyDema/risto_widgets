## Risto Widgets for Flutter

[![pub package](https://img.shields.io/pub/v/risto_widgets.svg)](https://pub.dev/packages/risto_widgets)
[![Build Status](https://img.shields.io/github/actions/workflow/status/frenkydema/risto_widgets/flutter.yml)](https://github.com/frenkydema/risto_widgets/actions/workflows/flutter.yml)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

### Overview

The **Risto Widgets** library provides a collection of customizable Flutter widgets designed to simplify UI development. These include widgets like buttons, expandable list tiles, and custom action sheets, all of which can be easily integrated into your Flutter app.

### Widgets

#### 1. `ListTileButton`

A customizable button that mimics a `ListTile` widget, with options for leading, trailing, body, and more. Ideal for creating buttons that resemble list items.

```dart
import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileButton(
      body: Text('ListTileButton'),
      leading: Icon(Icons.list),
      onPressed: () {
        print('Button pressed');
      },
    );
  }
}
```

#### 2. `CustomActionButton`

A flexible button widget that allows for custom content and styles. Use this widget when you need a button with more customization options than the default Flutter buttons provide.

```dart
import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomActionButton(
      onPressed: () {
        print('Custom action button pressed');
      },
      backgroundColor: Colors.blue,
      child: Text('Press Me'),
    );
  }
}
```

#### 3. `IncrementDecrementWidget`

A widget for incrementing and decrementing values, complete with customizable increment and decrement buttons. This widget is ideal for use cases like quantity selection.

```dart
import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return IncrementDecrementWidget(
      quantity: quantity,
      maxQuantity: 10,
      minValue: 1,
      onIncrement: () {
        setState(() {
          quantity++;
        });
      },
      onDecrement: () {
        setState(() {
          quantity--;
        });
      },
    );
  }
}
```

#### 4. `ExpandableListTileButton`

A widget that combines a `ListTileButton` with expandable functionality, allowing you to show or hide additional content when the button is pressed. Useful for creating collapsible sections in your UI.

```dart
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:risto_widgets/risto_widgets.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ExpandableController controller = ExpandableController();

    return ExpandableListTileButton(
      controller: controller,
      expanded: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey[200],
        child: Text('Expanded content goes here'),
      ),
      buttonBody: Text('Expandable ListTile Button'),
      buttonLeading: Icon(Icons.info),
    );
  }
}
```

#### 5. `OpenCustomSheet`

A utility for displaying custom modal sheets with confirm and cancel actions. This widget simplifies the creation of modal dialogs for user confirmations or custom content.

```dart
import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        OpenCustomSheet.openConfirmSheet(
          context,
          body: Text('Are you sure?'),
          onClose: (value) {
            if (value == true) {
              print('Confirmed');
            } else {
              print('Cancelled');
            }
          },
        );
      },
      child: Text('Open Sheet'),
    );
  }
}
```

### Features

- **Customizable Buttons**: Includes `ListTileButton` and `CustomActionButton` with flexible UI options.
- **Expandable List Tiles**: Easily create expandable sections with `ExpandableListTileButton`.
- **State Management Ready**: Widgets are designed to work seamlessly with popular state management solutions like `flutter_bloc`.
- **UI Customization**: Customize widgets with various options for colors, padding, borders, and more.

### Usage

To use the Risto Widgets, simply import the package and integrate the desired widget into your Flutter app.

For more examples and documentation, visit the [pub.dev page](https://pub.dev/packages/risto_widgets) or the [GitHub repository](https://github.com/frenkydema/risto_widgets).
```

### Descrizione dei Widget:
- **ListTileButton**: Un pulsante personalizzabile che imita un `ListTile`, ideale per creare pulsanti che somigliano a voci di elenco.
- **CustomActionButton**: Un pulsante flessibile che permette di aggiungere contenuti e stili personalizzati.
- **IncrementDecrementWidget**: Un widget per incrementare e decrementare valori, utile per selezioni di quantità.
- **ExpandableListTileButton**: Un widget che combina un `ListTileButton` con funzionalità espandibili per mostrare o nascondere contenuti aggiuntivi.
- **OpenCustomSheet**: Un'utilità per mostrare fogli modali personalizzati con azioni di conferma e annullamento.