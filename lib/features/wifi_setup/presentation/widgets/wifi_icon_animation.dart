import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/wifi_setup_constants.dart';

class WifiIconAnimation extends StatefulWidget {
  final bool isConnected;
  final double size;

  const WifiIconAnimation({
    super.key,
    this.isConnected = false,
    this.size = 140,
  });

  @override
  State<WifiIconAnimation> createState() => _WifiIconAnimationState();
}

class _WifiIconAnimationState extends State<WifiIconAnimation>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize pulse animation
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Initialize rotation animation
    _rotationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );

    // Start animations
    _pulseController.repeat(reverse: true);
    _rotationController.repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer dashed circles with pulse animation
          if (!widget.isConnected) ...[
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _pulseAnimation.value,
                  child: _buildDashedCircle(
                    widget.size,
                    Colors.white.withOpacity(0.3),
                    2,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _pulseAnimation.value * 0.8,
                  child: _buildDashedCircle(
                    widget.size * 0.8,
                    Colors.white.withOpacity(0.3),
                    2,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _pulseAnimation.value * 0.6,
                  child: _buildDashedCircle(
                    widget.size * 0.6,
                    Colors.white.withOpacity(0.3),
                    2,
                  ),
                );
              },
            ),
          ],

          // Inner solid circles for connected state
          if (widget.isConnected) ...[
            _buildSolidCircle(
              widget.size * 0.8,
              WifiSetupConstants.primaryGold.withOpacity(0.3),
            ),
            _buildSolidCircle(
              widget.size * 0.6,
              WifiSetupConstants.primaryGold.withOpacity(0.3),
            ),
            _buildSolidCircle(
              widget.size * 0.4,
              WifiSetupConstants.primaryGold.withOpacity(0.3),
            ),
          ],

          // Central icon container with rotation animation
          AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value * 2 * 3.14159,
                child: Container(
                  width: widget.size * 0.4,
                  height: widget.size * 0.4,
                  decoration: BoxDecoration(
                    color: widget.isConnected
                        ? WifiSetupConstants.primaryGold
                        : const Color(0xFFF5F5DC), // Light beige background
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: widget.isConnected
                        ? const Icon(Icons.check, color: Colors.white, size: 40)
                        : SvgPicture.asset(
                            WifiSetupConstants.wifiIconPath,
                            width: widget.size * 0.25,
                            height: widget.size * 0.25,
                          ),
                  ),
                ),
              );
            },
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
