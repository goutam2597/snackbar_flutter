import 'package:flutter/material.dart';
import '../enums/snackbar_type.dart';

/// Helper class for snackbar utilities
class SnackBarHelpers {
  /// Get color based on snackbar type
  static Color getColors(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return const Color(0xFF10B981);
      case SnackBarType.error:
        return const Color(0xFFEF4444);
      case SnackBarType.warning:
        return const Color(0xFFF59E0B);
      case SnackBarType.info:
        return const Color(0xFF3B82F6);
      case SnackBarType.primary:
        return const Color(0xFF8B5CF6);
      case SnackBarType.secondary:
        return const Color(0xFF6B7280);
      case SnackBarType.dark:
        return const Color(0xFF1F2937);
      case SnackBarType.light:
        return const Color(0xFFF3F4F6);
      case SnackBarType.gradient:
        return const Color(0xFF8B5CF6);
      case SnackBarType.custom:
        return const Color(0xFF3B82F6);
    }
  }

  /// Get icon based on snackbar type
  static IconData getIcon(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Icons.check_circle_rounded;
      case SnackBarType.error:
        return Icons.error_rounded;
      case SnackBarType.warning:
        return Icons.warning_rounded;
      case SnackBarType.info:
        return Icons.info_rounded;
      case SnackBarType.primary:
        return Icons.star_rounded;
      case SnackBarType.secondary:
        return Icons.circle_notifications_rounded;
      case SnackBarType.dark:
        return Icons.dark_mode_rounded;
      case SnackBarType.light:
        return Icons.light_mode_rounded;
      case SnackBarType.gradient:
        return Icons.gradient_rounded;
      case SnackBarType.custom:
        return Icons.widgets_rounded;
    }
  }

  /// Get title based on snackbar type
  static String getTitle(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return 'Success';
      case SnackBarType.error:
        return 'Error';
      case SnackBarType.warning:
        return 'Warning';
      case SnackBarType.info:
        return 'Info';
      case SnackBarType.primary:
        return 'Notification';
      case SnackBarType.secondary:
        return 'Update';
      case SnackBarType.dark:
        return 'Message';
      case SnackBarType.light:
        return 'Note';
      case SnackBarType.gradient:
        return 'Special';
      case SnackBarType.custom:
        return 'Custom';
    }
  }
}
