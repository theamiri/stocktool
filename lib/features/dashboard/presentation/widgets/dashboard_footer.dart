import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';

class DashboardFooter extends StatelessWidget {
  const DashboardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DashboardConstants.bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Image.asset(
            'assets/images/app_logo.png',
            width: DashboardConstants.logoSize,
            height: DashboardConstants.logoSize,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),

          // App name
          Text(
            DashboardConstants.appTitle,
            style: const TextStyle(
              color: DashboardConstants.textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
