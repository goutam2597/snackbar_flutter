import 'package:flutter/material.dart';

/// Base class for snackbar style builders
abstract class SnackBarStyleBuilder {
  Widget build({
    required String message,
    required String title,
    required Color color,
    required IconData icon,
    String? actionLabel,
    VoidCallback? onActionPressed,
  });
}
