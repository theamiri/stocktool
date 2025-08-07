import 'package:flutter/material.dart';
import '../widgets/dashboard_button.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_footer.dart';
import '../../../../core/theme/app_theme.dart';

class DashboardView1Page extends StatelessWidget {
  const DashboardView1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header with user info
            const DashboardHeader(),

            // Main content with vertical buttons
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Action buttons
                    DashboardButton(
                      icon: Icons.devices,
                      title: 'NEW DEVICE',
                      onPressed: () {
                        // TODO: Handle new device
                      },
                    ),
                    const SizedBox(height: 16),

                    DashboardButton(
                      icon: Icons.hub,
                      title: 'SETUP HUB',
                      onPressed: () {
                        // TODO: Handle setup hub
                      },
                    ),
                    const SizedBox(height: 16),

                    DashboardButton(
                      icon: Icons.wifi,
                      title: 'SETUP WIFI',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/wifi-networks');
                      },
                    ),
                    const SizedBox(height: 16),

                    DashboardButton(
                      icon: Icons.settings,
                      title: 'CONFIGURATION',
                      onPressed: () {
                        // TODO: Handle configuration
                      },
                    ),
                    const SizedBox(height: 16),

                    DashboardButton(
                      icon: Icons.bar_chart,
                      title: 'STOCK DETAILS',
                      onPressed: () {
                        // TODO: Handle stock details
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Footer with logo
            const DashboardFooter(),
          ],
        ),
      ),
    );
  }
}
