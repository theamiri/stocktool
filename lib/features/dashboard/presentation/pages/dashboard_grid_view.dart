import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/index.dart';

class DashboardGridView extends StatelessWidget {
  const DashboardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Grid of feature cards
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildFeatureCard(
                  icon: 'assets/svgs/add-device.svg',
                  title: 'NEW DEVICE',
                  onTap: () {
                    Navigator.pushNamed(context, '/qr-setup');
                  },
                ),
                _buildFeatureCard(
                  icon: 'assets/svgs/setup_hub.svg',
                  title: 'SETUP HUB',
                  onTap: () {
                    // TODO: Navigate to new label
                  },
                ),
                _buildFeatureCard(
                  icon: 'assets/svgs/setup_wifi.svg',
                  title: 'SETUP WIFI',
                  onTap: () {
                    Navigator.pushNamed(context, '/wifi-setup');
                  },
                ),

                _buildFeatureCard(
                  icon: 'assets/svgs/configuration.svg',
                  title: 'CONFIGURATION',
                  onTap: () {
                    // TODO: Navigate to configuration
                  },
                ),
                _buildFeatureCard(
                  icon: 'assets/svgs/stock_details.svg',
                  title: 'STOCK DETAILS',
                  onTap: () {
                    // TODO: Navigate to configuration
                  },
                ),
              ],
            ),
          ),

          // Footer with logo
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              SvgPicture.asset(
                icon,
                width: 48,
                height: 48,
                colorFilter: ColorFilter.mode(
                  AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),

              const SizedBox(height: 12),

              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          SvgPicture.asset(
            'assets/svgs/stock_tools_icon.svg',
            width: 40,
            height: 40,
          ),

          const SizedBox(width: 12),

          // App name
          const Text(
            'STOCK TOOLS',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
