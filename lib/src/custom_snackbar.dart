import 'package:flutter/material.dart';
import 'package:snackbar_flutter/snackbar_flutter.dart';
import 'package:snackbar_flutter/src/utils/snackbar_helpers.dart';
import 'package:snackbar_flutter/src/widgets/snackbar_widget.dart';

/// Main CustomSnackBar class with static methods to show snackbars
class CustomSnackBar {
  // Store the current overlay entry to manage single snackbar
  static OverlayEntry? _currentOverlayEntry;

  /// Show a snackbar with specified parameters
  static void show({
    required BuildContext context,
    required String message,
    SnackBarType type = SnackBarType.info,
    SnackBarStyle style = SnackBarStyle.classic,
    SnackBarPosition position = SnackBarPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    String? title,
    IconData? customIcon,
    Color? customColor,
    VoidCallback? onTap,
    String? actionLabel,
    VoidCallback? onActionPressed,
    bool dismissible = true,
    double? width,
    EdgeInsets? margin,
    bool replaceExisting =
        true, // যদি true হয়, পুরাতন snackbar remove করে নতুন দেখাবে
    SnackBarDismissDirection dismissDirection =
        SnackBarDismissDirection.any, // Dismiss direction
    Color? titleColor, // Custom title text color
    Color? messageColor, // Custom message text color
    double? titleFontSize, // Custom title font size
    double? messageFontSize, // Custom message font size
    FontWeight? titleFontWeight, // Custom title font weight
    FontWeight? messageFontWeight, // Custom message font weight
    Widget Function(BuildContext, String, String, Color, IconData)?
    customBuilder, // Full custom builder
  }) {
    final colors = customColor ?? SnackBarHelpers.getColors(type);
    final icon = customIcon ?? SnackBarHelpers.getIcon(type);
    final snackBarTitle = title ?? SnackBarHelpers.getTitle(type);

    final overlay = Overlay.of(context);

    // যদি replaceExisting true এবং আগে থেকে snackbar থাকে, তাহলে remove করো
    if (replaceExisting && _currentOverlayEntry != null) {
      if (_currentOverlayEntry!.mounted) {
        _currentOverlayEntry!.remove();
      }
      _currentOverlayEntry = null;
    }

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => SnackBarWidget(
        message: message,
        title: snackBarTitle,
        type: type,
        style: style,
        position: position,
        duration: duration,
        colors: colors,
        icon: icon,
        onTap: onTap,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
        dismissible: dismissible,
        width: width,
        margin: margin,
        dismissDirection: dismissDirection,
        titleColor: titleColor,
        messageColor: messageColor,
        titleFontSize: titleFontSize,
        messageFontSize: messageFontSize,
        titleFontWeight: titleFontWeight,
        messageFontWeight: messageFontWeight,
        customBuilder: customBuilder,
        onDismiss: () {
          if (overlayEntry.mounted) {
            overlayEntry.remove();
          }
          // Clean up the reference
          if (_currentOverlayEntry == overlayEntry) {
            _currentOverlayEntry = null;
          }
        },
      ),
    );

    // Store current overlay entry
    _currentOverlayEntry = overlayEntry;
    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
      // Clean up the reference
      if (_currentOverlayEntry == overlayEntry) {
        _currentOverlayEntry = null;
      }
    });
  }

  /// Manually dismiss the current snackbar
  static void dismiss() {
    if (_currentOverlayEntry != null && _currentOverlayEntry!.mounted) {
      _currentOverlayEntry!.remove();
      _currentOverlayEntry = null;
    }
  }
}
