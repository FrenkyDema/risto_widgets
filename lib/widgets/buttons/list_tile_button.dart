import 'package:expandable/expandable.dart';
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

class ExpandableListTileButton extends StatefulWidget {
  final ExpandableController controller;
  final Widget expanded;
  final Widget? buttonBody;
  final Widget? subtitle;
  final Widget? buttonLeading;
  final IconData? icon;
  final Widget? customHeader;
  final Color? backgroundColor;
  final Color? expandedColor;
  final Widget? trailing;
  final double? size;
  final Color? iconColor;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  const ExpandableListTileButton({
    super.key,
    required this.controller,
    required this.expanded,
    this.buttonBody,
    this.subtitle,
    this.buttonLeading,
    this.customHeader,
    this.icon,
    this.backgroundColor,
    this.expandedColor = Colors.white,
    this.trailing,
    this.size = 60,
    this.iconColor,
    this.contentPadding,
    this.padding,
    this.onPressed,
  });

  // Constructor for ListTile button style
  const ExpandableListTileButton.listTile({
    super.key,
    required this.controller,
    required this.expanded,
    this.buttonBody,
    this.subtitle,
    this.buttonLeading,
    this.backgroundColor,
    this.expandedColor = Colors.white,
    this.trailing,
    this.onPressed
  })  : customHeader = null,
        icon = null,
        size = null,
        iconColor = null,
        contentPadding = null,
        padding = null;

  // Constructor for Icon ListTile button style
  const ExpandableListTileButton.iconListTile({
    super.key,
    required this.controller,
    required this.expanded,
    required IconData this.icon,
    required Widget title,
    this.subtitle,
    this.trailing,
    this.size = 60,
    this.backgroundColor,
    this.expandedColor = Colors.white,
    this.iconColor,
    this.contentPadding,
    this.padding,
  })  : buttonBody = title,
        buttonLeading = null,
        customHeader = null,
        onPressed = null;

  // Constructor for custom header widget
  const ExpandableListTileButton.customHeader({
    super.key,
    required this.controller,
    required this.expanded,
    required this.customHeader,
    this.backgroundColor,
    this.expandedColor = Colors.white,
    this.trailing,
  })  : buttonBody = null,
        subtitle = null,
        buttonLeading = null,
        icon = null,
        size = null,
        iconColor = null,
        contentPadding = null,
        padding = null,
        onPressed = null;

  @override
  State<ExpandableListTileButton> createState() =>
      _ExpandableListTileButtonState();
}

class _ExpandableListTileButtonState extends State<ExpandableListTileButton> {
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: widget.controller,
      header: GestureDetector(
        onTap: () => setState(() => widget.controller.toggle()),
        child: _buildHeader(context, widget.controller.value),
      ),
      theme: const ExpandableThemeData(
        tapHeaderToExpand: false,
        hasIcon: false,
      ),
      collapsed: const SizedBox(),
      expanded: GestureDetector(
        onTap: () {
          // Handle tap on the expanded content if needed
        },
        child: widget.expanded,
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool expanded) {
    // Determine which header to build based on the initialized variables
    if (widget.customHeader != null) {
      return GestureDetector(
        onTap: () => setState(() => widget.controller.toggle()),
        child: widget.customHeader!,
      );
    } else if (widget.icon != null) {
      return _buildIconHeader(context);
    } else {
      return _buildDefaultHeader(context);
    }
  }

  Widget _buildIconHeader(BuildContext context) {
    return ListTileButton(
      backgroundColor: widget.backgroundColor ?? Theme.of(context).cardColor,
      body: widget.buttonBody ?? const Text(''),
      leading: AspectRatio(
        aspectRatio: 1,
        child: FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          child: Icon(
            widget.icon,
            color: widget.iconColor ?? Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      height: widget.size,
      padding: widget.padding ?? EdgeInsets.zero,
      contentPadding: widget.contentPadding,
      visualDensity: const VisualDensity(horizontal: 2, vertical: 2),
      bodyAlignment: ListTileTitleAlignment.threeLine,
      subtitle: widget.subtitle,
      trailing: widget.trailing,
      onPressed: () => setState(
          () => widget.controller.toggle()), // Add the toggle functionality
    );
  }

  Widget _buildDefaultHeader(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: widget.expandedColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
            top: Radius.circular(10),
          ),
        ),
      ),
      child: ListTileButton(
        onPressed: () => setState(() => widget.controller.toggle()),
        subtitle: widget.subtitle,
        leading: widget.buttonLeading,
        body: widget.buttonBody,
        backgroundColor: widget.backgroundColor,
        trailing: widget.trailing ?? const Icon(Icons.expand_more),
      ),
    );
  }
}
