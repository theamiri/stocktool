import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/splash_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashConstants.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: SvgPicture.asset(
                'assets/svgs/mesh.svg',
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  SplashConstants.primaryGold,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  width: SplashConstants.logoSize,
                  height: SplashConstants.logoSize,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: SplashConstants.subtitleBottomSpacing),
                Text(
                  SplashConstants.locationText,
                  style: const TextStyle(
                    fontSize: SplashConstants.locationFontSize,
                    fontWeight: FontWeight.w400,
                    color: SplashConstants.textColor,
                    letterSpacing: 4.0,
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
