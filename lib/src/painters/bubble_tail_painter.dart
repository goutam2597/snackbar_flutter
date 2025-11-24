import 'package:flutter/material.dart';

/// Custom painter for bubble tail
class BubbleTailPainter extends CustomPainter {
  final Color color;

  BubbleTailPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BubbleTailPainter oldDelegate) => false;
}
