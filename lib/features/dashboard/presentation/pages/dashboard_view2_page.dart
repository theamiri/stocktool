import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/dashboard_constants.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_footer.dart';
import '../widgets/dashboard_card.dart';
import '../../../../core/theme/app_theme.dart';

class DashboardView2Page extends StatelessWidget {
  const DashboardView2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header with user info
            const DashboardHeader(),

            // Main content with setup button and cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Grid of cards
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          DashboardCard(
                            iconPath: 'assets/svgs/setup_hub.svg',
                            title: 'SETUP DEVICE',
                            onPressed: () {
                              // TODO: Handle setup device
                            },
                          ),
                          DashboardCard(
                            iconPath: 'assets/svgs/setup_hub.svg',
                            title: 'SETUP HUB',
                            onPressed: () {
                              // TODO: Handle setup hub
                            },
                          ),
                          DashboardCard(
                            iconPath: 'assets/svgs/setup_wifi.svg',
                            title: 'SETUP WIFI',
                            onPressed: () {
                              context.push('/wifi-networks');
                            },
                          ),
                          DashboardCard(
                            iconPath: 'assets/svgs/configuration.svg',
                            title: 'CONFIGURATION',
                            onPressed: () {
                              // TODO: Handle configuration
                            },
                          ),
                          DashboardCard(
                            iconPath: 'assets/svgs/stock_details.svg',
                            title: 'STOCK DETAILS',
                            onPressed: () {
                              // TODO: Handle stock details
                            },
                          ),
                        ],
                      ),
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
