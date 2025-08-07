import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stocktool/core/theme/app_theme.dart';
import 'dart:async';
import '../constants/wifi_setup_constants.dart';
import '../widgets/app_logo_footer.dart';

class WifiConnectedPage extends StatefulWidget {
  const WifiConnectedPage({super.key});

  @override
  State<WifiConnectedPage> createState() => _WifiConnectedPageState();
}

class _WifiConnectedPageState extends State<WifiConnectedPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Auto-navigate back to dashboard after 1 second
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        context.go('/dashboard');
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryGold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Container(
                margin: const EdgeInsets.all(WifiSetupConstants.largePadding),
                padding: const EdgeInsets.all(
                  WifiSetupConstants.extraLargePadding,
                ),
                decoration: BoxDecoration(
                  color: WifiSetupConstants.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(
                    WifiSetupConstants.cardBorderRadius,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Connected icon animation
                    // Use the SVG wifi icon with AppTheme.primaryGold color
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          AppTheme.primaryGold,
                          BlendMode.srcIn,
                        ),
                        child: SvgPicture.asset(
                          'assets/svgs/wifi_icon.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: WifiSetupConstants.largePadding),

                    // Connected text
                    Text(
                      WifiSetupConstants.connectedText,
                      style: const TextStyle(
                        fontSize: 28,

                        color: WifiSetupConstants.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Back button
            Spacer(),
            AppLogoFooter(),
          ],
        ),
      ),
    );
  }
}
