import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/wifi_setup_constants.dart';

class WifiNetworksButton extends StatelessWidget {
  final VoidCallback onPressed;

  const WifiNetworksButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: WifiSetupConstants.cardBackgroundColor,
        foregroundColor: WifiSetupConstants.iconColor,
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            WifiSetupConstants.buttonBorderRadius,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: WifiSetupConstants.largePadding,
          vertical: WifiSetupConstants.padding,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/svgs/router.svg', width: 20, height: 20),
          const SizedBox(width: WifiSetupConstants.padding),
          Text(
            WifiSetupConstants.wifiNetworksButtonText,
            style: const TextStyle(
              color: WifiSetupConstants.iconColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
