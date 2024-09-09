import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart';

class ExpandableListTileButton extends StatefulWidget {
  final Widget expanded;
  final Widget? buttonBody;
  final double collapsedHeight;
  final Color? backgroundColor;
  final Color? expandedColor;
  final double elevation;
  final Widget? leading;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;
  final Widget Function(Function tapAction)? customHeader;

  const ExpandableListTileButton({
    super.key,
    required this.expanded,
    this.buttonBody,
    this.collapsedHeight = 60.0,
    this.backgroundColor,
    this.expandedColor,
    this.elevation = 4.0,
    this.leading,
    this.icon,
    this.iconColor,
    this.trailing,
    this.customHeader,
  });

  // Named constructors for different types of headers
  factory ExpandableListTileButton.listTile({
    required Widget expanded,
    Widget? buttonBody,
    double collapsedHeight = 60.0,
    Color? backgroundColor,
    Color? expandedColor,
    double elevation = 4.0,
    Widget? leading,
    Widget? trailing,
  }) {
    return ExpandableListTileButton(
      expanded: expanded,
      buttonBody: buttonBody,
      collapsedHeight: collapsedHeight,
      backgroundColor: backgroundColor,
      expandedColor: expandedColor,
      elevation: elevation,
      leading: leading,
      trailing: trailing,
      customHeader: null,
    );
  }

  factory ExpandableListTileButton.iconListTile({
    required Widget expanded,
    IconData? icon,
    Color? iconColor,
    double collapsedHeight = 60.0,
    Color? backgroundColor,
    Color? expandedColor,
    double elevation = 4.0,
    Widget? trailing,
    Widget? buttonBody,
  }) {
    return ExpandableListTileButton(
      expanded: expanded,
      buttonBody: buttonBody,
      collapsedHeight: collapsedHeight,
      backgroundColor: backgroundColor,
      expandedColor: expandedColor,
      elevation: elevation,
      icon: icon,
      iconColor: iconColor,
      trailing: trailing,
      customHeader: null,
    );
  }

  factory ExpandableListTileButton.custom({
    required Widget expanded,
    required Widget Function(Function tapAction) customHeader,
    double collapsedHeight = 60.0,
    Color? backgroundColor,
    Color? expandedColor,
    double elevation = 4.0,
  }) {
    return ExpandableListTileButton(
      expanded: expanded,
      collapsedHeight: collapsedHeight,
      backgroundColor: backgroundColor,
      expandedColor: expandedColor,
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
      } else {
        setState(() {
          _bodyWidget = widget.expanded;
        });
      }
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
    return Stack(
      children: [
        // Expanded body below header
        Padding(
          padding: EdgeInsets.only(top: widget.collapsedHeight / 2),
          child: SizeTransition(
            sizeFactor: _animation,
            axisAlignment: 1.0,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.expandedColor ?? Colors.blue[300],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.only(top: 30),
              child: _bodyWidget,
            ),
          ),
        ),
        // Header
        widget.customHeader != null
            ? widget.customHeader!(_toggleExpansion)
            : _buildDefaultHeader(context),
      ],
    );
  }

  Widget _buildDefaultHeader(BuildContext context) {
    return widget.icon != null
        ? IconListTileButton(
            icon: widget.icon!,
            iconColor: widget.iconColor,
            title: widget.buttonBody!,
            size: widget.collapsedHeight,
            onPressed: _toggleExpansion,
            trailing: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.white,
            ),
            backgroundColor: widget.backgroundColor ?? Colors.blueGrey,
          )
        : ListTileButton(
            onPressed: _toggleExpansion,
            leading: widget.leading,
            body: widget.buttonBody,
            trailing: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.white,
            ),
            backgroundColor: widget.backgroundColor ?? Colors.blueGrey,
          );
  }
}
