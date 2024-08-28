import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/list_tile_button.dart';

class OpenCustomSheet extends StatelessWidget {
  final bool barrierDismissible;
  final String? barrierLabel;
  final Color? barrierColor;
  final Function? onClose;
  final Widget Function({ScrollController? scrollController}) body;

  // builder
  final bool? scrollable;
  final bool? expand;
  final double? initialChildSize;
  final double? minChildSize;
  final double? maxChildSize;

  const OpenCustomSheet({
    super.key,
    this.barrierDismissible = true,
    this.barrierColor,
    this.barrierLabel,
    this.onClose,
    required this.body,
    this.expand,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.scrollable,
  });

  void show(BuildContext context) {
    showModalBottomSheet(
      isDismissible: barrierDismissible,
      backgroundColor: Colors.transparent,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      isScrollControlled: scrollable ?? false,
      useSafeArea: true,
      context: context,
      builder: (context) {
        if (scrollable ?? false) {
          return DraggableScrollableSheet(
            expand: expand ?? true,
            initialChildSize: initialChildSize ?? 0.5,
            minChildSize: minChildSize ?? 0.25,
            maxChildSize: maxChildSize ?? 1.0,
            builder: (context, scrollController) =>
                body(scrollController: scrollController),
          );
        }

        return body();
      },
    ).then(
          (Object? value) {
        try {
          onClose?.call(value) ?? () {};
        } catch (e) {
          debugPrint("sheet error: $e");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  static void openConfirmSheet(
      BuildContext context, {
        required Widget body,
        void Function(dynamic value)? onClose,
        bool? expand,
        double? initialChildSize,
        double? minChildSize,
        double? maxChildSize,
        bool? scrollable,
        Color? backgroundColor,
        Color? handleColor,
        Color? buttonColor,
        Color? buttonTextColor,
        EdgeInsetsGeometry? padding,
        double? buttonSpacing,
      }) {
    OpenCustomSheet(
      scrollable: scrollable,
      expand: expand,
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      onClose: onClose,
      body: ({scrollController}) => Container(
        decoration: BoxDecoration(
          borderRadius:
          const BorderRadiusDirectional.vertical(top: Radius.circular(10)),
          color: backgroundColor ?? Theme.of(context).cardColor,
        ),
        padding: padding ?? const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 5,
                decoration: BoxDecoration(
                    color: handleColor ?? CupertinoColors.inactiveGray,
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Center(child: body),
            ),
            DoubleListTileButtons(
              padding: padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
              space: buttonSpacing ?? 16.0,
              firstButton: ListTileButton(
                onPressed: () => Navigator.pop(context, false),
                backgroundColor: buttonColor ?? Theme.of(context).cardColor,
                body: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Close', // Replaced `tr('chiudi')` with a static string or you can handle localization separately.
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: buttonTextColor ?? Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              secondButton: ListTileButton(
                onPressed: () => Navigator.pop(context, true),
                backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
                body: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Confirm', // Replaced `tr('conferma')` with a static string or you can handle localization separately.
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: buttonTextColor ?? Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).show(context);
  }
}