import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrSetupPage extends StatelessWidget {
  const QrSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: // AppBar with back button
      AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
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
          SafeArea(
            child: Column(
              children: [
                // Main content area
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/add-device.svg',
                        width: 170,
                      ),
                      const SizedBox(height: 40),
                      // Scan QR Code button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              shadowColor: Colors.black.withOpacity(0.1),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/qr-scanner');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svgs/qrcode.svg',
                                  width: 32,
                                  height: 32,
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'SCAN QR CODE',
                                  style: TextStyle(fontSize: 16),
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
        ],
      ),
    );
  }
}
