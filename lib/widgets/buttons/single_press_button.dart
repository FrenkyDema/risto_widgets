// widgets.dart

import 'package:flutter/material.dart';
import 'package:risto_widgets/risto_widgets.dart'; // Ensure this import points to your custom widgets package

/// A customizable button that ensures the [onPressed] callback is invoked
/// only once per press. It prevents multiple invocations during a single press,
/// making it ideal for handling actions that shouldn't be executed multiple times
/// concurrently, such as network requests.
class SinglePressButton extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The callback that is called when the button is tapped.
  /// It can be asynchronous.
  final Future<void> Function() onPressed;

  /// The amount of space to surround the child inside the button.
  final EdgeInsetsGeometry? padding;

  /// The external margin around the button.
  final EdgeInsetsGeometry? margin;

  /// The background color of the button when enabled.
  final Color? color;

  /// The background color of the button when disabled.
  final Color? disabledColor;

  /// The border radius of the button.
  final double borderRadius;

  /// The text style for the button's label.
  final TextStyle? textStyle;

  /// The elevation of the button.
  final double? elevation;

  /// The shape of the button's material.
  final OutlinedBorder? shape;

  /// Whether to show a loading indicator while processing.
  final bool showLoadingIndicator;

  /// The color of the loading indicator.
  final Color? loadingIndicatorColor;

  /// Callback invoked when the button starts processing.
  final VoidCallback? onStartProcessing;

  /// Callback invoked when the button finishes processing.
  final VoidCallback? onFinishProcessing;

  /// Callback invoked when an error occurs during processing.
  final void Function(Object error)? onError;

  /// Creates a [SinglePressButton].
  const SinglePressButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding,
    this.margin,
    this.color,
    this.disabledColor,
    this.borderRadius = 8.0,
    this.textStyle,
    this.elevation,
    this.shape,
    this.showLoadingIndicator = false,
    this.loadingIndicatorColor,
    this.onStartProcessing,
    this.onFinishProcessing,
    this.onError,
  });

  @override
  State<SinglePressButton> createState() => _SinglePressButtonState();
}

class _SinglePressButtonState extends State<SinglePressButton> {
  bool _isProcessing = false;

  /// Handles the button press by invoking [widget.onPressed].
  /// It ensures that the callback is invoked only once per press.
  Future<void> _handlePress() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    // Invoke onStartProcessing callback if provided.
    widget.onStartProcessing?.call();

    try {
      await widget.onPressed();
    } catch (error) {
      // Invoke onError callback if provided.
      if (widget.onError != null) {
        widget.onError!(error);
      } else {
        // If no onError is provided, rethrow the exception.
        rethrow;
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });

        // Invoke onFinishProcessing callback if provided.
        widget.onFinishProcessing?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine the button's background color based on its state.
    final Color backgroundColor = _isProcessing
        ? (widget.disabledColor ?? Theme.of(context).disabledColor)
        : (widget.color ?? Theme.of(context).primaryColor);

    return Container(
      margin: widget.margin, // Apply the external margin here
      child: CustomActionButton(
        onPressed: _isProcessing ? null : _handlePress,
        padding: widget.padding,
        backgroundColor: backgroundColor,
        borderRadius: widget.borderRadius,
        elevation: widget.elevation,
        shape: widget.shape,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Original child
            widget.child,

            // Loading indicator overlay
            if (_isProcessing && widget.showLoadingIndicator)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.loadingIndicatorColor ??
                        Theme.of(context).colorScheme.onPrimary,
                  ),
                  strokeWidth: 2.5,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
