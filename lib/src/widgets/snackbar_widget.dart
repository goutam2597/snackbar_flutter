import 'package:flutter/material.dart';
import '../enums/snackbar_type.dart';
import '../enums/snackbar_position.dart';
import '../enums/snackbar_style.dart';
import '../enums/dismiss_direction.dart' show SnackBarDismissDirection;
import '../styles/style_factory.dart';

/// Main widget for rendering the snackbar
class SnackBarWidget extends StatefulWidget {
  final String message;
  final String title;
  final SnackBarType type;
  final SnackBarStyle style;
  final SnackBarPosition position;
  final Duration duration;
  final Color colors;
  final IconData icon;
  final VoidCallback onDismiss;
  final VoidCallback? onTap;
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final bool dismissible;
  final double? width;
  final EdgeInsets? margin;
  final SnackBarDismissDirection dismissDirection;
  final Color? titleColor;
  final Color? messageColor;
  final double? titleFontSize;
  final double? messageFontSize;
  final FontWeight? titleFontWeight;
  final FontWeight? messageFontWeight;
  final Widget Function(BuildContext, String, String, Color, IconData)?
  customBuilder;

  const SnackBarWidget({
    super.key,
    required this.message,
    required this.title,
    required this.type,
    required this.style,
    required this.position,
    required this.duration,
    required this.colors,
    required this.icon,
    required this.onDismiss,
    this.onTap,
    this.actionLabel,
    this.onActionPressed,
    required this.dismissible,
    this.width,
    this.margin,
    this.dismissDirection = SnackBarDismissDirection.any,
    this.titleColor,
    this.messageColor,
    this.titleFontSize,
    this.messageFontSize,
    this.titleFontWeight,
    this.messageFontWeight,
    this.customBuilder,
  });

  @override
  State<SnackBarWidget> createState() => _SnackBarWidgetState();
}

class _SnackBarWidgetState extends State<SnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  bool _isDismissed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    final begin = widget.position == SnackBarPosition.top
        ? const Offset(0, -1)
        : const Offset(0, 1);

    _slideAnimation = Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Future.delayed(widget.duration - const Duration(milliseconds: 400), () {
      if (mounted && !_isDismissed) {
        _controller.reverse().then((_) {
          if (mounted && !_isDismissed) {
            widget.onDismiss();
          }
        });
      }
    });
  }

  void _handleDismiss() {
    if (!_isDismissed) {
      _isDismissed = true;
      _controller.reverse().then((_) {
        if (mounted) {
          widget.onDismiss();
        }
      });
    }
  }

  // Convert custom SnackBarDismissDirection to Flutter's DismissDirection
  DismissDirection _convertDismissDirection(
    SnackBarDismissDirection direction,
  ) {
    switch (direction) {
      case SnackBarDismissDirection.left:
        return DismissDirection.endToStart;
      case SnackBarDismissDirection.right:
        return DismissDirection.startToEnd;
      case SnackBarDismissDirection.top:
        return DismissDirection.up;
      case SnackBarDismissDirection.bottom:
        return DismissDirection.down;
      case SnackBarDismissDirection.any:
        return DismissDirection.horizontal;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultMargin =
        widget.margin ??
        EdgeInsets.only(
          left: 16,
          right: 16,
          top: widget.position == SnackBarPosition.top ? 50 : 0,
          bottom: widget.position == SnackBarPosition.bottom ? 30 : 0,
        );

    // Use custom builder if provided
    Widget snackBarContent = widget.customBuilder != null
        ? widget.customBuilder!(
            context,
            widget.title,
            widget.message,
            widget.colors,
            widget.icon,
          )
        : StyleFactory.buildStyle(
            style: widget.style,
            message: widget.message,
            title: widget.title,
            color: widget.colors,
            icon: widget.icon,
            actionLabel: widget.actionLabel,
            onActionPressed: widget.onActionPressed,
            titleColor: widget.titleColor,
            messageColor: widget.messageColor,
            titleFontSize: widget.titleFontSize,
            messageFontSize: widget.messageFontSize,
            titleFontWeight: widget.titleFontWeight,
            messageFontWeight: widget.messageFontWeight,
          );

    if (widget.onTap != null) {
      snackBarContent = GestureDetector(
        onTap: widget.onTap,
        child: snackBarContent,
      );
    }

    if (widget.dismissible) {
      // Convert DismissDirection to Flutter's DismissDirection
      final flutterDismissDirection = _convertDismissDirection(
        widget.dismissDirection,
      );

      snackBarContent = Dismissible(
        key: UniqueKey(),
        direction: flutterDismissDirection,
        onDismissed: (_) => _handleDismiss(),
        child: snackBarContent,
      );
    }

    return Positioned(
      top: widget.position == SnackBarPosition.top ? defaultMargin.top : null,
      bottom: widget.position == SnackBarPosition.bottom
          ? defaultMargin.bottom
          : null,
      left: defaultMargin.left,
      right: defaultMargin.right,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: widget.width != null
                ? SizedBox(width: widget.width, child: snackBarContent)
                : snackBarContent,
          ),
        ),
      ),
    );
  }
}
