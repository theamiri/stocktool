import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DashboardConstants.headerHeight,
      decoration: const BoxDecoration(
        color: DashboardConstants.primaryGold,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
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
              style: TextStyle(
                color: DashboardConstants.headerTextColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // User email
            const Text(
              DashboardConstants.userEmail,
              style: TextStyle(
                color: DashboardConstants.headerTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
