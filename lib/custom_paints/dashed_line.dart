import 'package:flutter/material.dart';

/// Paints a dashed line with the given [dashWidth], [dashSpace], [color], and [strokeWidth]. 
class RMDashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;
  final double strokeWidth;

  RMDashedLinePainter({
    this.dashWidth = 9.0,
    this.dashSpace = 5.0,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
