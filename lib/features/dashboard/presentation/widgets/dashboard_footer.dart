import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/index.dart';

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
          AppLogo(
            width: AppTheme.smallLogoSize,
            height: AppTheme.smallLogoSize,
          ),
          const SizedBox(width: 12),

          // App name
          Text(DashboardConstants.appTitle, style: AppTheme.appTitleStyle),
        ],
      ),
    );
  }
}
