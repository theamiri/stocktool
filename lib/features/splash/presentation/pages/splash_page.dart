import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../constants/splash_constants.dart';
import '../../../../core/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(Duration(seconds: SplashConstants.splashDelaySeconds));
    if (mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
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
                colorFilter: ColorFilter.mode(
                  AppTheme.primaryGold,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/app_logo.png',
                  width: SplashConstants.logoSize,
                  height: SplashConstants.logoSize,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: SplashConstants.subtitleBottomSpacing),

                // Location text
                Text(
                  SplashConstants.locationText,
                  style: TextStyle(
                    fontSize: SplashConstants.locationFontSize,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.textColor,
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
