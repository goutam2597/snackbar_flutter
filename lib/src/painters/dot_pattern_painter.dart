import 'package:flutter/material.dart';

/// Custom painter for dot pattern
class DotPatternPainter extends CustomPainter {
  final Color color;

  DotPatternPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (double x = 0; x < size.width; x += 15) {
      for (double y = 0; y < size.height; y += 15) {
        canvas.drawCircle(Offset(x, y), 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DotPatternPainter oldDelegate) => false;
}
