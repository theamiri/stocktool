import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';
import '../../../../core/theme/app_theme.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DashboardConstants.headerHeight,
      decoration: AppTheme.headerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(DashboardConstants.headerPadding),
        child: Column(
          children: [
            // Top row with menu and user info
            Row(
              children: [
                // Menu icon
                const Icon(
                  Icons.menu,
                  color: DashboardConstants.headerTextColor,
                  size: 24,
                ),
                const Spacer(),
                // User profile icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: DashboardConstants.headerTextColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: DashboardConstants.primaryGold,
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
            const Text(
              DashboardConstants.userName,
              style: AppTheme.userNameStyle,
            ),
            const SizedBox(height: 8),

            // User email
            const Text(
              DashboardConstants.userEmail,
              style: AppTheme.userEmailStyle,
            ),
          ],
        ),
      ),
    );
  }
}
