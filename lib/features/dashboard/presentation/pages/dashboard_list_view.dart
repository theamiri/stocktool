import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/index.dart';

class DashboardListView extends StatelessWidget {
  const DashboardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // List of action buttons
          Expanded(
            child: Column(
              children: [
                _buildActionButton(
                  icon: 'assets/svgs/add-device.svg',
                  text: 'NEW DEVICE',
                  onTap: () {
                    Navigator.pushNamed(context, '/qr-setup');
                  },
                ),
                const SizedBox(height: 16),

                _buildActionButton(
                  icon: 'assets/svgs/setup_hub.svg',
                  text: 'SETUP HUB',
                  onTap: () {
                    // TODO: Navigate to setup hub
                  },
                ),
                const SizedBox(height: 16),

                _buildActionButton(
                  icon: 'assets/svgs/setup_wifi.svg',
                  text: 'SETUP WIFI',
                  onTap: () {
                    Navigator.pushNamed(context, '/wifi-setup');
                  },
                ),
                const SizedBox(height: 16),

                _buildActionButton(
                  icon: 'assets/svgs/configuration.svg',
                  text: 'CONFIGURATION',
                  onTap: () {
                    // TODO: Navigate to configuration
                  },
                ),
                const SizedBox(height: 16),

                _buildActionButton(
                  icon: 'assets/svgs/stock_details.svg',
                  text: 'STOCK DETAILS',
                  onTap: () {
                    // TODO: Navigate to stock details
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),

              const SizedBox(width: 16),

              // Text
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
