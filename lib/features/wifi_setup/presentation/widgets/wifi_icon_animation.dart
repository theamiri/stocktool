import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/wifi_setup_constants.dart';

class WifiIconAnimation extends StatelessWidget {
  final bool isConnected;
  final double size;

  const WifiIconAnimation({
    super.key,
    this.isConnected = false,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer dashed circles
          if (!isConnected) ...[
            _buildDashedCircle(size, Colors.white.withOpacity(0.3), 2),
            _buildDashedCircle(size * 0.8, Colors.white.withOpacity(0.3), 2),
            _buildDashedCircle(size * 0.6, Colors.white.withOpacity(0.3), 2),
          ],

          // Inner solid circles for connected state
          if (isConnected) ...[
            _buildSolidCircle(
              size * 0.8,
              WifiSetupConstants.primaryGold.withOpacity(0.3),
            ),
            _buildSolidCircle(
              size * 0.6,
              WifiSetupConstants.primaryGold.withOpacity(0.3),
            ),
            _buildSolidCircle(
              size * 0.4,
              WifiSetupConstants.primaryGold.withOpacity(0.3),
            ),
          ],

          // Central icon container
          Container(
            width: size * 0.4,
            height: size * 0.4,
            decoration: BoxDecoration(
              color: isConnected
                  ? WifiSetupConstants.primaryGold
                  : const Color(0xFFF5F5DC), // Light beige background
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: isConnected
                  ? const Icon(Icons.check, color: Colors.white, size: 40)
                  : SvgPicture.asset(
                      WifiSetupConstants.wifiIconPath,
                      width: size * 0.25,
                      height: size * 0.25,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashedCircle(double diameter, Color color, double strokeWidth) {
    return CustomPaint(
      size: Size(diameter, diameter),
      painter: DashedCirclePainter(color: color, strokeWidth: strokeWidth),
    );
  }

  Widget _buildSolidCircle(double diameter, Color color) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  DashedCirclePainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw dashed circle
    const dashLength = 8.0;
    const dashSpace = 8.0;
    final totalLength = 2 * 3.14159 * radius;
    final dashCount = (totalLength / (dashLength + dashSpace)).round();

    for (int i = 0; i < dashCount; i++) {
      final startAngle = (i * (dashLength + dashSpace) / radius);
      final endAngle = ((i + 1) * dashLength / radius);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
