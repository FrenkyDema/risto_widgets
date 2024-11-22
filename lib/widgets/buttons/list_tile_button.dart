// widgets.dart

import 'package:flutter/material.dart';

class ListTileButton extends StatelessWidget {
  // Behavior
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  // Layout
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? leadingPadding;

  // Content
  final Widget? leading;
  final double leadingSizeFactor;
  final Widget? body;
  final Widget? subtitle;
  final Widget? trailing;

  // Style
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final double? elevation;

  // Visual Aspects
  final VisualDensity? visualDensity;
  final ListTileTitleAlignment? bodyAlignment;

  // Constraints
  final double? minHeight;

  const ListTileButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.margin,
    this.padding,
    this.contentPadding,
    this.leadingPadding,
    this.leading,
    this.leadingSizeFactor = 1.0,
    required this.body,
    this.subtitle,
    this.trailing,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 10,
    this.elevation,
    this.visualDensity,
    this.bodyAlignment,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;
    if (leading != null) {
      leadingWidget = Padding(
        padding: leadingPadding ?? const EdgeInsets.all(8.0),
        child: Transform.scale(
          scale: leadingSizeFactor,
          alignment: Alignment.center,
          child: leading,
        ),
      );
    }

    return RoundedContainer(
      margin: margin,
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
                minHeight: minHeight ?? 50.0,
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    if (leadingWidget != null) leadingWidget,
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
  // Behavior
  final VoidCallback? onPressed;

  // Layout
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;

  // Content
  final IconData icon;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;

  // Style
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final double leadingSizeFactor;
  final double? elevation;

  const IconListTileButton({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.leadingSizeFactor = 1.0,
    this.margin,
    this.padding,
    this.contentPadding,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileButton(
      margin: margin,
      padding: padding,
      contentPadding: contentPadding,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
      body: title,
      subtitle: subtitle,
      trailing: trailing,
      onPressed: onPressed,
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).iconTheme.color,
        size: 24.0,
      ),
      leadingSizeFactor: leadingSizeFactor,
      bodyAlignment: ListTileTitleAlignment.threeLine,
    );
  }
}

class RoundedContainer extends StatelessWidget {
  // Layout
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  // Content
  final Widget child;

  // Style
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final double? elevation;

  const RoundedContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 10,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        elevation: elevation ?? 0,
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor ?? Theme.of(context).cardColor,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: borderColor != null
                ? Border.all(color: borderColor!, width: 2)
                : null,
          ),
          child: child,
        ),
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
                SizedBox(width: space ?? 8),
                Expanded(child: secondButton),
              ]
            : [
                firstButton,
                SizedBox(width: space ?? 8),
                secondButton,
              ],
      ),
    );
  }
}
