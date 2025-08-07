import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WifiConnectedPage extends StatelessWidget {
  const WifiConnectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Success content
                  Spacer(),
                  Center(
                    child: Container(
                      width: 280,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Success circle with checkmark
                          SvgPicture.asset(
                            'assets/svgs/wifi_icon.svg',
                            width: 200,
                            height: 200,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // CONNECTED text
                          const Text(
                            'CONNECTED',
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
