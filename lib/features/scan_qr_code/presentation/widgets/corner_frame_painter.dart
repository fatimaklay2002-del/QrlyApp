import 'package:flutter/material.dart';

class CornerFramePainter extends CustomPainter{
  final Color color;
  const CornerFramePainter({required this.color});
 
  @override
  void paint(Canvas canvas, Size size) {
    const double cornerLength = 28;
    const double radius = 16;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
 
    void drawCorner(Offset origin, double dx, double dy) {
      final path = Path()
        ..moveTo(origin.dx, origin.dy + dy * cornerLength)
        ..lineTo(origin.dx, origin.dy + dy * radius)
        ..quadraticBezierTo(
          origin.dx,
          origin.dy,
          origin.dx + dx * radius,
          origin.dy,
        )
        ..lineTo(origin.dx + dx * cornerLength, origin.dy);
      canvas.drawPath(path, paint);
    }
 
    drawCorner(const Offset(0, 0), 1, 1); // أعلى يسار
    drawCorner(Offset(size.width, 0), -1, 1); // أعلى يمين
    drawCorner(Offset(0, size.height), 1, -1); // أسفل يسار
    drawCorner(Offset(size.width, size.height), -1, -1); // أسفل يمين
  }
 
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

