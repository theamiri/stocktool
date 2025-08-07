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
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: WifiSetupConstants.padding),
          // App name
          const Text(
            WifiSetupConstants.appName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
