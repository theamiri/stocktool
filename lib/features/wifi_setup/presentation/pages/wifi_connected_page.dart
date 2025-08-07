import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/wifi_setup_constants.dart';
import '../widgets/app_logo_footer.dart';
import '../widgets/wifi_icon_animation.dart';
import '../widgets/background_pattern.dart';

class WifiConnectedPage extends StatelessWidget {
  const WifiConnectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WifiSetupConstants.backgroundColor,
      body: Stack(
        children: [
          // Background pattern
          const BackgroundPattern(),

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
                    child: Container(
                      margin: const EdgeInsets.all(
                        WifiSetupConstants.largePadding,
                      ),
                      padding: const EdgeInsets.all(
                        WifiSetupConstants.extraLargePadding,
                      ),
                      decoration: BoxDecoration(
                        color: WifiSetupConstants.cardBackgroundColor,
                        borderRadius: BorderRadius.circular(
                          WifiSetupConstants.cardBorderRadius,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Connected icon animation
                          const WifiIconAnimation(size: 120, isConnected: true),

                          const SizedBox(
                            height: WifiSetupConstants.largePadding,
                          ),

                          // Connected text
                          Text(
                            WifiSetupConstants.connectedText,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: WifiSetupConstants.textColor,
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

          // App logo footer
          const AppLogoFooter(),
        ],
      ),
    );
  }
}
