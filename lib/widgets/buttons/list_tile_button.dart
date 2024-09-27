import 'package:flutter/material.dart';

class ListTileButton extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final Widget? body;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final double borderRadius;
  final VisualDensity? visualDensity;
  final Color? backgroundColor;
  final ListTileTitleAlignment? bodyAlignment;
  final double? elevation;
  final double? leadingSizeFactor;
  final double? minHeight;

  const ListTileButton({
    super.key,
    this.padding,
    this.contentPadding,
    this.borderColor,
    this.backgroundColor,
    this.leading,
    required this.body,
    this.subtitle,
    this.trailing,
    this.onPressed,
    this.borderRadius = 10,
    this.visualDensity,
    this.onLongPress,
    this.bodyAlignment,
    this.elevation,
    this.leadingSizeFactor,
    this.minHeight = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          onLongPress: onLongPress,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(8),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: minHeight ?? 56.0,
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    if (leading != null)
                      SizedBox(
                        width: (leadingSizeFactor != null &&
                                leadingSizeFactor! * 24 > 48)
                            ? leadingSizeFactor! * 24
                            : 48,
                        height: double.infinity,
                        child: leading,
                      ),
                    Expanded(
                      child: ListTile(
                        titleAlignment: bodyAlignment,
                        visualDensity: visualDensity ?? VisualDensity.compact,
                        contentPadding:
                            contentPadding ?? const EdgeInsets.only(left: 8),
                        minVerticalPadding: 0,
                        minLeadingWidth: 0,
                        title: body,
                        subtitle: subtitle,
                      ),
                    ),
                    if (trailing != null)
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        alignment: Alignment.center,
                        height: double.infinity,
                        child: trailing,
                      ),
                  ],
                ),
              ),
            ),
          ),
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
  final double? elevation;
  final double sizeFactor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final void Function()? onPressed;

  const IconListTileButton({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
    this.sizeFactor = 1.0,
    this.padding,
    this.contentPadding,
    this.onPressed,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileButton(
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      body: title,
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).iconTheme.color,
        size: 24.0 * sizeFactor,
      ),
      leadingSizeFactor: sizeFactor,
      padding: padding,
      contentPadding: contentPadding,
      bodyAlignment: ListTileTitleAlignment.threeLine,
      subtitle: subtitle,
      trailing: trailing,
      onPressed: onPressed,
      elevation: elevation,
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderRadius;
  final Widget child;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const RoundedContainer({
    super.key,
    this.borderColor,
    this.backgroundColor,
    this.borderRadius = 10,
    required this.child,
    this.elevation,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0,
      borderRadius: BorderRadius.circular(borderRadius),
      color: backgroundColor ?? Theme.of(context).cardColor,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 2)
              : null,
        ),
        child: child,
      ),
    );
  }
}

class DoubleListTileButtons extends StatelessWidget {
  final Widget firstButton;
  final Widget secondButton;
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
                Expanded(child: secondButton),
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
