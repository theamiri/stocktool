import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';
import '../../../../core/theme/app_theme.dart';

class DashboardFooter extends StatelessWidget {
  const DashboardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.paddingHuge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Image.asset(
            'assets/images/app_logo.png',
            width: AppTheme.smallLogoSize,
            height: AppTheme.smallLogoSize,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),

          // App name
          Text(DashboardConstants.appTitle, style: AppTheme.appTitleStyle),
        ],
      ),
    );
  }
}
