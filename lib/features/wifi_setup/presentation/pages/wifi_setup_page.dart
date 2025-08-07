import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WifiSetupPage extends StatelessWidget {
  const WifiSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6A72C), // Mustard yellow background
      body: SafeArea(
        child: Stack(
          children: [
            // Background pattern (subtle geometric pattern)
            Positioned.fill(
              child: CustomPaint(painter: BackgroundPatternPainter()),
            ),

            // Main content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Back button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // WiFi icon section
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // WiFi icon with background
                        Transform.rotate(
                          angle: 0.1, // Slight rotation
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFF2A121,
                              ), // Lighter yellow background
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/svgs/wifi_icon.svg',
                                width: 120,
                                height: 120,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // WiFi Networks button
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/wifi-networks');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  // WiFi router icon
                                  SvgPicture.asset(
                                    'assets/svgs/router.svg',
                                    width: 24,
                                    height: 24,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.grey,
                                      BlendMode.srcIn,
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  // Text
                                  const Text(
                                    'WIFI NETWORKS',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Footer with logo
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: [
                  // Logo
                  SvgPicture.asset(
                    'assets/svgs/stock_tools_icon.svg',
                    width: 40,
                    height: 40,
                  ),

                  const SizedBox(width: 12),

                  // App name
                  const Text(
                    'STOCK TOOLS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for background pattern
class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    // Draw subtle geometric pattern
    for (int i = 0; i < size.width; i += 30) {
      for (int j = 0; j < size.height; j += 30) {
        if ((i + j) % 60 == 0) {
          canvas.drawCircle(Offset(i.toDouble(), j.toDouble()), 2, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
