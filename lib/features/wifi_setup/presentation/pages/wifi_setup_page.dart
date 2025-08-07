import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WifiSetupPage extends StatelessWidget {
  const WifiSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Footer with logo
            Positioned(
              right: 0,
              left: 0,
              bottom: 50,
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/stock_tools_icon.svg',
                  width: 170,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: -60,
              child: SvgPicture.asset(
                'assets/svgs/mesh.svg',
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5),
                  BlendMode.srcIn,
                ),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  // WiFi icon section
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/svgs/wifi_icon.svg',
                            width: 230,
                            height: 230,
                          ),
                        ),

                        const SizedBox(height: 40),
                        // WiFi Networks button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadowColor: Colors.black.withOpacity(0.1),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/wifi-networks');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                      ],
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
