import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                      iconPath: 'assets/svgs/add-device.svg',
                      title: 'NEW DEVICE',
                      onPressed: () {
                        // TODO: Handle new device
                      },
                    ),
                    const SizedBox(height: 16),

                    DashboardButton(
                      iconPath: 'assets/svgs/setup_hub.svg',
                      title: 'SETUP HUB',
                      onPressed: () {
                        // TODO: Handle setup hub
                      },
                    ),
                    const SizedBox(height: 16),

                    DashboardButton(
                      iconPath: 'assets/svgs/setup_wifi.svg',
                      title: 'SETUP WIFI',
                      onPressed: () {
                        context.push('/wifi-networks');
                      },
                    ),
                    const SizedBox(height: 16),

                    DashboardButton(
                      iconPath: 'assets/svgs/configuration.svg',
                      title: 'CONFIGURATION',
                      onPressed: () {
                        // TODO: Handle configuration
                      },
                    ),
                    const SizedBox(height: 16),

                    DashboardButton(
                      iconPath: 'assets/svgs/stock_details.svg',
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
