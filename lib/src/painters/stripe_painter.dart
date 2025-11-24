import 'package:flutter/material.dart';

/// Custom painter for stripe pattern
class StripePainter extends CustomPainter {
  final Color color;

  StripePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    for (double i = -size.height; i < size.width; i += 20) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(StripePainter oldDelegate) => false;
}
