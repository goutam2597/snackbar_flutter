import 'package:flutter/material.dart';
import '../enums/snackbar_style.dart';
import 'all_styles.dart';

/// Factory class to build different snackbar styles
class StyleFactory {
  static Widget buildStyle({
    required SnackBarStyle style,
    required String message,
    required String title,
    required Color color,
    required IconData icon,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Color? titleColor,
    Color? messageColor,
    double? titleFontSize,
    double? messageFontSize,
    FontWeight? titleFontWeight,
    FontWeight? messageFontWeight,
  }) {
    switch (style) {
      case SnackBarStyle.classic:
        return AllStyles.buildClassic(
          message: message,
          title: title,
          color: color,
          icon: icon,
          actionLabel: actionLabel,
          onActionPressed: onActionPressed,
        );
      case SnackBarStyle.frosted:
        return AllStyles.buildFrosted(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.minimal:
        return AllStyles.buildMinimal(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.gradient:
        return AllStyles.buildGradient(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.floating:
        return AllStyles.buildFloating(
          message: message,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.material:
        return AllStyles.buildMaterial(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.ios:
        return AllStyles.buildIOS(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.outlined:
        return AllStyles.buildOutlined(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.compact:
        return AllStyles.buildCompact(
          message: message,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.expanded:
        return AllStyles.buildExpanded(
          message: message,
          title: title,
          color: color,
          icon: icon,
          actionLabel: actionLabel,
          onActionPressed: onActionPressed,
        );
      case SnackBarStyle.iconOnly:
        return AllStyles.buildIconOnly(color: color, icon: icon);
      case SnackBarStyle.neon:
        return AllStyles.buildNeon(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.neumorphic:
        return AllStyles.buildNeumorphic(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.card:
        return AllStyles.buildCard(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.pill:
        return AllStyles.buildPill(message: message, color: color, icon: icon);
      case SnackBarStyle.banner:
        return AllStyles.buildBanner(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.grunge:
        return AllStyles.buildGrunge(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.bubble:
        return AllStyles.buildBubble(
          message: message,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.stripe:
        return AllStyles.buildStripe(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.pixel:
        return AllStyles.buildPixel(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.glass:
        return AllStyles.buildGlass(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.threeDimensional:
        return AllStyles.build3D(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.dotted:
        return AllStyles.buildDotted(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
      case SnackBarStyle.diagonal:
        return AllStyles.buildDiagonal(
          message: message,
          title: title,
          color: color,
          icon: icon,
        );
    }
  }
}
