import 'package:flutter/material.dart';

import 'list_tile_button.dart';

class ExpandableListTileButton extends StatefulWidget {
  final Widget expanded;
  final Widget? buttonBody;
  final Color? backgroundColor;
  final Color? expandedColor;
  final Color? iconColor;
  final Color? trailingIconColor;
  final Color? borderColor;
  final double elevation;
  final Widget? leading;
  final IconData? icon;
  final Widget Function(Function tapAction, bool isExpanded)? customHeader;

  const ExpandableListTileButton({
    super.key,
    required this.expanded,
    this.buttonBody,
    this.backgroundColor,
    this.expandedColor,
    this.iconColor,
    this.trailingIconColor,
    this.borderColor,
    this.elevation = 4.0,
    this.leading,
    this.icon,
    this.customHeader,
  });

  factory ExpandableListTileButton.listTile({
    required Widget expanded,
    Widget? buttonBody,
    Color? backgroundColor,
    Color? expandedColor,
    Color? trailingIconColor,
    Color? borderColor,
    double elevation = 4.0,
    Widget? leading,
  }) {
    return ExpandableListTileButton(
      expanded: expanded,
      buttonBody: buttonBody,
      backgroundColor: backgroundColor,
      expandedColor: expandedColor,
      trailingIconColor: trailingIconColor,
      borderColor: borderColor,
      elevation: elevation,
      leading: leading,
      customHeader: (toggleExpansion, isExpanded) => ListTileButton(
        onPressed: () => toggleExpansion.call(),
        leading: leading,
        body: buttonBody,
        trailing: Icon(
          isExpanded ? Icons.expand_less : Icons.expand_more,
          color: trailingIconColor,
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  factory ExpandableListTileButton.iconListTile({
    required Widget expanded,
    required IconData icon,
    Widget? buttonBody,
    Color? backgroundColor,
    Color? expandedColor,
    Color? iconColor,
    Color? trailingIconColor,
    Color? borderColor,
    double elevation = 4.0,
  }) {
    return ExpandableListTileButton(
      expanded: expanded,
      buttonBody: buttonBody,
      backgroundColor: backgroundColor,
      expandedColor: expandedColor,
      icon: icon,
      iconColor: iconColor,
      trailingIconColor: trailingIconColor,
      borderColor: borderColor,
      elevation: elevation,
      customHeader: (toggleExpansion, isExpanded) => IconListTileButton(
        icon: icon,
        title: buttonBody!,
        trailing: Icon(
          isExpanded ? Icons.expand_less : Icons.expand_more,
          color: trailingIconColor,
        ),
        onPressed: () => toggleExpansion.call(),
        backgroundColor: backgroundColor,
        iconColor: iconColor,
      ),
    );
  }

  factory ExpandableListTileButton.custom({
    required Widget expanded,
    required Widget Function(Function tapAction, bool isExpanded) customHeader,
    Color? backgroundColor,
    Color? expandedColor,
    Color? iconColor,
    Color? trailingIconColor,
    Color? borderColor,
    double elevation = 4.0,
  }) {
    return ExpandableListTileButton(
      expanded: expanded,
      backgroundColor: backgroundColor,
      expandedColor: expandedColor,
      iconColor: iconColor,
      trailingIconColor: trailingIconColor,
      borderColor: borderColor,
      elevation: elevation,
      customHeader: customHeader,
    );
  }

  @override
  State<ExpandableListTileButton> createState() =>
      _ExpandableListTileButtonState();
}

class _ExpandableListTileButtonState extends State<ExpandableListTileButton>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  late Widget _bodyWidget;
  double _headerHeight = 0.0;
  final GlobalKey _headerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _bodyWidget = const SizedBox();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _bodyWidget = const SizedBox();
        });
      } else if (status == AnimationStatus.forward ||
          status == AnimationStatus.completed) {
        setState(() {
          _bodyWidget = widget.expanded;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateHeaderHeight();
    });
  }

  void _updateHeaderHeight() {
    final RenderBox? renderBox =
        _headerKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final height = renderBox.size.height;
      if (_headerHeight != height) {
        setState(() {
          _headerHeight = height;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant ExpandableListTileButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateHeaderHeight();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: _headerHeight / 2),
          child: SizeTransition(
            sizeFactor: _animation,
            axisAlignment: 1.0,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.expandedColor ??
                    theme.colorScheme.secondary.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border.all(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              padding: EdgeInsets.only(top: _headerHeight / 2),
              child: _bodyWidget,
            ),
          ),
        ),
        Container(
          key: _headerKey,
          child: widget.customHeader != null
              ? widget.customHeader!(_toggleExpansion, _isExpanded)
              : _buildDefaultHeader(context, theme),
        ),
      ],
    );
  }

  Widget _buildDefaultHeader(BuildContext context, ThemeData theme) {
    return widget.icon != null
        ? IconListTileButton(
            icon: widget.icon!,
            iconColor: widget.iconColor ?? theme.iconTheme.color,
            title: widget.buttonBody!,
            onPressed: _toggleExpansion,
            trailing: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              color: widget.trailingIconColor ?? theme.iconTheme.color,
            ),
            backgroundColor: widget.backgroundColor ?? theme.cardColor,
          )
        : ListTileButton(
            onPressed: _toggleExpansion,
            leading: widget.leading,
            body: widget.buttonBody,
            trailing: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              color: widget.trailingIconColor ?? theme.iconTheme.color,
            ),
            backgroundColor: widget.backgroundColor ?? theme.cardColor,
          );
  }
}
