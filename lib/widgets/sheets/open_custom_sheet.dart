import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/custom_action_button.dart';
import '../buttons/list_tile_button.dart';

class OpenCustomSheet {
  final bool barrierDismissible;
  final String? barrierLabel;
  final Color? barrierColor;
  final Function(dynamic)? onClose;
  final Widget Function({ScrollController? scrollController}) body;

  final bool scrollable;
  final bool expand;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;

  final Color? backgroundColor;
  final Color? handleColor;
  final ShapeBorder? sheetShape;
  final EdgeInsetsGeometry? sheetPadding;

  final Color? firstButtonColor;
  final Color? secondButtonColor;
  final Color? firstButtonTextColor;
  final Color? secondButtonTextColor;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final EdgeInsetsGeometry? padding;
  final double? buttonSpacing;
  final bool showDefaultButtons;

  const OpenCustomSheet({
    this.barrierDismissible = true,
    this.barrierColor,
    this.barrierLabel,
    this.onClose,
    required this.body,
    this.scrollable = false,
    this.expand = true,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 1.0,
    this.backgroundColor,
    this.handleColor,
    this.sheetShape,
    this.sheetPadding,
    this.firstButtonColor,
    this.secondButtonColor,
    this.firstButtonTextColor,
    this.secondButtonTextColor,
    this.confirmButtonText,
    this.cancelButtonText,
    this.padding,
    this.buttonSpacing,
    this.showDefaultButtons = true,
  });

  /// Factory constructor per creare un foglio di conferma
  factory OpenCustomSheet.openConfirmSheet(
    BuildContext context, {
    required Widget body,
    Function(dynamic)? onClose,
    Color? backgroundColor,
    Color? handleColor,
    bool barrierDismissible = true,
    Color? firstButtonColor,
    Color? secondButtonColor,
    Color? firstButtonTextColor,
    Color? secondButtonTextColor,
    String? confirmButtonText,
    String? cancelButtonText,
    EdgeInsetsGeometry? padding,
    double? buttonSpacing,
  }) {
    return OpenCustomSheet(
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      onClose: onClose,
      backgroundColor: backgroundColor,
      handleColor: handleColor,
      padding: padding,
      buttonSpacing: buttonSpacing,
      firstButtonColor: firstButtonColor,
      secondButtonColor: secondButtonColor,
      firstButtonTextColor: firstButtonTextColor,
      secondButtonTextColor: secondButtonTextColor,
      confirmButtonText: confirmButtonText,
      cancelButtonText: cancelButtonText,
      showDefaultButtons: true,
      body: ({scrollController}) => body,
    );
  }

  /// Factory constructor per creare un foglio scrollabile
  factory OpenCustomSheet.scrollableSheet(
    BuildContext context, {
    required Widget Function({ScrollController? scrollController}) body,
    Function(dynamic)? onClose,
    bool expand = true,
    double initialChildSize = 0.5,
    double minChildSize = 0.25,
    double maxChildSize = 1.0,
    Color? barrierColor,
    Color? backgroundColor,
    Color? handleColor,
    bool barrierDismissible = true,
    ShapeBorder? sheetShape,
    EdgeInsetsGeometry? sheetPadding,
  }) {
    return OpenCustomSheet(
      scrollable: true,
      expand: expand,
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      onClose: onClose,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      backgroundColor: backgroundColor,
      handleColor: handleColor,
      sheetShape: sheetShape,
      sheetPadding: sheetPadding,
      showDefaultButtons: false,
      body: body,
    );
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final maxHeight = mediaQuery.size.height * 0.9;
        if (scrollable) {
          return DraggableScrollableSheet(
            expand: expand,
            initialChildSize: initialChildSize,
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  color: backgroundColor ?? Theme.of(context).cardColor,
                ),
                padding: sheetPadding ?? const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    if (handleColor != Colors.transparent)
                      _buildHandle(handleColor),
                    Expanded(
                      child: body(scrollController: scrollController),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          // Per sheet non scrollabile, ma con scorrimento solo se necessario
          return Container(
            constraints: BoxConstraints(
              maxHeight: maxHeight,
            ),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              color: backgroundColor ?? Theme.of(context).cardColor,
            ),
            padding: sheetPadding ?? const EdgeInsets.only(bottom: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (handleColor != Colors.transparent)
                  _buildHandle(handleColor),
                Flexible(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: body(scrollController: null),
                    ),
                  ),
                ),
                if (showDefaultButtons)
                  _buildButtons(
                    context,
                    firstButtonColor,
                    secondButtonColor,
                    firstButtonTextColor,
                    secondButtonTextColor,
                    buttonSpacing,
                    confirmButtonText,
                    cancelButtonText,
                  ),
              ],
            ),
          );
        }
      },
    ).then((value) {
      if (onClose != null) {
        onClose!(value);
      }
    });
  }

  /// Costruisce i pulsanti di conferma/rifiuto
  static Widget _buildButtons(
    BuildContext context,
    Color? firstButtonColor,
    Color? secondButtonColor,
    Color? firstButtonTextColor,
    Color? secondButtonTextColor,
    double? buttonSpacing,
    String? confirmButtonText,
    String? cancelButtonText,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: DoubleListTileButtons(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        space: buttonSpacing ?? 8,
        firstButton: CustomActionButton.flat(
          margin: EdgeInsets.zero,
          width: double.infinity,
          onPressed: () => Navigator.pop(context, false),
          backgroundColor: firstButtonColor ?? Colors.red,
          child: Text(
            cancelButtonText ?? 'Close',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: firstButtonTextColor ?? Colors.white,
                ),
          ),
        ),
        secondButton: CustomActionButton.flat(
          onPressed: () => Navigator.pop(context, true),
          margin: EdgeInsets.zero,
          width: double.infinity,
          backgroundColor: secondButtonColor ?? Colors.green,
          child: Text(
            confirmButtonText ?? 'Confirm',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: secondButtonTextColor ?? Colors.white,
                ),
          ),
        ),
      ),
    );
  }

  /// Costruisce il drag handle
  static Widget _buildHandle(Color? handleColor) {
    return Center(
      child: Container(
        width: 150,
        height: 5,
        decoration: BoxDecoration(
          color: handleColor ?? CupertinoColors.inactiveGray,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}
