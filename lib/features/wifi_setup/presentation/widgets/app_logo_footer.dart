import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/wifi_setup_constants.dart';

class AppLogoFooter extends StatelessWidget {
  const AppLogoFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: WifiSetupConstants.largePadding,
      left: WifiSetupConstants.largePadding,
      child: Row(
        children: [
          // App logo
          SvgPicture.asset(
            WifiSetupConstants.stockToolsIconPath,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          // App name
          const Text(
            WifiSetupConstants.appName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
