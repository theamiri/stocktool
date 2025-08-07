import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/wifi_setup_constants.dart';

class AppLogoFooter extends StatelessWidget {
  const AppLogoFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              WifiSetupConstants.stockToolsIconPath,
              width: 180,
            ),
          ),
          Positioned(
            bottom: -80,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/svgs/mesh.svg',

              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
