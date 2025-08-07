import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/wifi_setup_constants.dart';
import '../widgets/wifi_networks_button.dart';
import '../widgets/app_logo_footer.dart';
import '../widgets/wifi_icon_animation.dart';

class WifiNetworksPage extends StatelessWidget {
  const WifiNetworksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WifiSetupConstants.backgroundColor,
      body: Stack(
        children: [
          // Main content
          SafeArea(
            child: Column(
              children: [
                // Back button
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(WifiSetupConstants.padding),
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),

                // Main content
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // WiFi icon animation
                        const WifiIconAnimation(size: 140, isConnected: false),

                        const SizedBox(height: WifiSetupConstants.largePadding),

                        // WiFi networks button
                        WifiNetworksButton(
                          onPressed: () {
                            context.push('/wifi-setup');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // App logo footer
          const AppLogoFooter(),
        ],
      ),
    );
  }
}
