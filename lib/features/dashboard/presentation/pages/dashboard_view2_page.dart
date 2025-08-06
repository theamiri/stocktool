import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_footer.dart';
import '../widgets/dashboard_card.dart';

class DashboardView2Page extends StatelessWidget {
  const DashboardView2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DashboardConstants.backgroundColor,
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
                    // Setup button
                    Container(
                      width: double.infinity,
                      height: DashboardConstants.buttonHeight,
                      decoration: BoxDecoration(
                        color: DashboardConstants.primaryGold,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // TODO: Handle setup
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: const Center(
                            child: Text(
                              'SETUP',
                              style: TextStyle(
                                color: DashboardConstants.headerTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Grid of cards
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          DashboardCard(
                            icon: Icons.devices,
                            title: 'NEW DEVICE',
                            onPressed: () {
                              // TODO: Handle new device
                            },
                          ),
                          DashboardCard(
                            icon: Icons.label,
                            title: 'NEW LABEL',
                            onPressed: () {
                              // TODO: Handle new label
                            },
                          ),
                          DashboardCard(
                            icon: Icons.wifi,
                            title: 'SETUP WIFI',
                            onPressed: () {
                              // TODO: Handle setup wifi
                            },
                          ),
                          DashboardCard(
                            icon: Icons.settings,
                            title: 'CONFIGURATION',
                            onPressed: () {
                              // TODO: Handle configuration
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
