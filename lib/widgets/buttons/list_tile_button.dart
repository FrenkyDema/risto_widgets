import 'package:flutter/material.dart';

class ListTileButton extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final Widget? body;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final double? height;
  final double? minTileHeight;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final double trailingSize;
  final double borderRadius;
  final VisualDensity? visualDensity;
  final Color? backgroundColor;
  final double? sizeFactor;

  final ListTileTitleAlignment? bodyAlignment;

  const ListTileButton({
    super.key,
    this.padding = EdgeInsets.zero,
    this.contentPadding,
    this.borderColor,
    this.backgroundColor,
    this.leading,
    required this.body,
    this.subtitle,
    this.trailing,
    this.height,
    this.minTileHeight,
    this.onPressed,
    this.trailingSize = 30,
    this.borderRadius = 10,
    this.visualDensity,
    this.onLongPress,
    this.bodyAlignment,
    this.sizeFactor,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      borderColor: borderColor ?? Colors.transparent,
      backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
      height: height,
      borderRadius: borderRadius,
      padding: padding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).splashColor,
          splashFactory: Theme.of(context).splashFactory,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
          disabledBackgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: ListTile(
          titleAlignment: bodyAlignment,
          visualDensity: visualDensity,
          minVerticalPadding: height != null ? 0 : null,
          contentPadding:
              contentPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          // Replace with dynamic padding if needed
          minLeadingWidth: 0,
          leading: leading != null
              ? SizedBox.square(
                  dimension: (height ?? 30) * (sizeFactor ?? 0.5),
                  child: leading,
                )
              : null,
          title: body,
          subtitle: subtitle,
          minTileHeight: height,
          trailing: trailing != null
              ? SizedBox.square(
                  dimension: trailingSize,
                  child: Center(
                    child: trailing,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class IconListTileButton extends StatelessWidget {
  final IconData icon;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double size;
  final double? sizeFactor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? contentPadding;
  final void Function()? onPressed;

  const IconListTileButton({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.size,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
    this.sizeFactor,
    this.padding = EdgeInsets.zero,
    this.contentPadding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileButton(
      borderColor: borderColor,
      backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
      body: title,
      leading: AspectRatio(
        aspectRatio: 1,
        child: FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: iconColor ?? Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      height: size,
      padding: padding,
      contentPadding: contentPadding,
      sizeFactor: sizeFactor,
      visualDensity: const VisualDensity(horizontal: 2, vertical: 2),
      bodyAlignment: ListTileTitleAlignment.threeLine,
      subtitle: subtitle,
      trailing: trailing,
      onPressed: onPressed,
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Color? borderColor;
  final Color? backgroundColor;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget child;

  const RoundedContainer({
    super.key,
    this.borderColor,
    this.backgroundColor,
    this.height,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 10,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        border: Border.fromBorderSide(
            BorderSide(color: borderColor ?? Colors.transparent, width: 2)),
        color: backgroundColor ?? Theme.of(context).cardColor,
      ),
      height: height,
      margin: padding,
      padding: EdgeInsets.zero,
      child: child,
    );
  }
}

class DoubleListTileButtons extends StatelessWidget {
  final ListTileButton firstButton;
  final ListTileButton secondButton;
  final EdgeInsetsGeometry padding;
  final bool expanded;
  final double? space;

  const DoubleListTileButtons({
    super.key,
    required this.firstButton,
    required this.secondButton,
    this.padding = EdgeInsets.zero,
    this.expanded = true,
    this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: expanded
            ? [
                Expanded(child: firstButton),
                SizedBox(width: space),
                Expanded(child: secondButton)
              ]
            : [
                firstButton,
                SizedBox(width: space),
                secondButton,
              ],
      ),
    );
  }
}
