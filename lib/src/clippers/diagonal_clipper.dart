import 'package:flutter/material.dart';

/// Custom clipper for diagonal edges
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(10, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 10, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(DiagonalClipper oldClipper) => false;
}
