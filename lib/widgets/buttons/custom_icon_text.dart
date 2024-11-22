import 'package:flutter/material.dart';

class CustomIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final MainAxisAlignment mainAxisAlignment;
  final TextStyle? textStyle;
  final double? iconSize;
  final double spacing;

  const CustomIconText({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.textStyle,
    this.iconSize,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveTextStyle = textStyle ??
        Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: color ?? Theme.of(context).textTheme.bodyMedium!.color);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize ?? effectiveTextStyle.fontSize,
          color: color ?? Theme.of(context).iconTheme.color,
        ),
        SizedBox(width: spacing),
        Flexible(
          child: Text(
            text,
            style: effectiveTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
