import 'package:flutter/material.dart';

class BackgroundPattern extends StatelessWidget {
  const BackgroundPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomPaint(painter: BackgroundPatternPainter()),
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
          .withOpacity(0.05) // More subtle pattern
      ..strokeWidth = 1;

    // Draw dots pattern
    const dotRadius = 2.0;
    const spacing = 20.0;

    for (double x = spacing; x < size.width; x += spacing) {
      for (double y = size.height * 0.6; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }

    // Draw connecting lines
    for (double x = spacing; x < size.width - spacing; x += spacing) {
      for (
        double y = size.height * 0.6;
        y < size.height - spacing;
        y += spacing
      ) {
        // Horizontal lines
        canvas.drawLine(Offset(x, y), Offset(x + spacing, y), paint);
        // Vertical lines
        canvas.drawLine(Offset(x, y), Offset(x, y + spacing), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
