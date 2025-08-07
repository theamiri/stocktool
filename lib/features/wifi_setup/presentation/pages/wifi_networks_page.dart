import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stocktool/core/theme/app_theme.dart';
import '../constants/wifi_setup_constants.dart';
import '../widgets/wifi_networks_button.dart';
import '../widgets/app_logo_footer.dart';

class WifiNetworksPage extends StatelessWidget {
  const WifiNetworksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryGold,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            // WiFi icon
            SvgPicture.asset(
              WifiSetupConstants.wifiIconPath,
              width: 200,
              height: 200,
            ),

            const SizedBox(height: WifiSetupConstants.largePadding),

            // WiFi networks button
            WifiNetworksButton(
              onPressed: () {
                context.push('/wifi-networks-list');
              },
            ),
            Spacer(),
            AppLogoFooter(),
          ],
        ),
      ),
    );
  }
}
