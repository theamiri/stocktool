import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';
import '../../../../core/theme/app_theme.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.headerHeight,
      decoration: AppTheme.headerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingLarge),
        child: Column(
          children: [
            // Top row with menu and user info
            Row(
              children: [
                // Menu icon
                Icon(Icons.menu, color: AppTheme.headerTextColor, size: 24),
                const Spacer(),
                // User profile icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppTheme.headerTextColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: AppTheme.primaryGold,
                    size: 30,
                  ),
                ),
                const Spacer(),
                // Empty space for balance
                const SizedBox(width: 24),
              ],
            ),
            const SizedBox(height: 20),

            // User name
            Text(DashboardConstants.userName, style: AppTheme.userNameStyle),
            const SizedBox(height: 8),

            // User email
            Text(DashboardConstants.userEmail, style: AppTheme.userEmailStyle),
          ],
        ),
      ),
    );
  }
}
