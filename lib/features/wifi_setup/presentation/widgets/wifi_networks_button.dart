import 'package:flutter/material.dart';
import '../constants/wifi_setup_constants.dart';

class WifiNetworksButton extends StatelessWidget {
  final VoidCallback onPressed;

  const WifiNetworksButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WifiSetupConstants.cardBackgroundColor,
        borderRadius: BorderRadius.circular(
          WifiSetupConstants.buttonBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(
            WifiSetupConstants.buttonBorderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: WifiSetupConstants.largePadding,
              vertical: WifiSetupConstants.padding,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Router icon
                Container(
                  width: WifiSetupConstants.iconSize,
                  height: WifiSetupConstants.iconSize,
                  decoration: BoxDecoration(
                    color: WifiSetupConstants.iconColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.router,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: WifiSetupConstants.padding),
                // Button text
                Text(
                  WifiSetupConstants.wifiNetworksButtonText,
                  style: const TextStyle(
                    color: WifiSetupConstants.iconColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
