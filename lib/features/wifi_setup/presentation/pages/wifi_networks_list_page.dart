import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stocktool/core/theme/app_theme.dart';
import '../constants/wifi_setup_constants.dart';

class WifiNetworksListPage extends StatelessWidget {
  const WifiNetworksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryGold,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
        ),
        title: const Text(
          'WIFI NETWORKS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 9, // Number of WiFi networks to show
        itemBuilder: (context, index) {
          return _buildWifiNetworkCard(context, index);
        },
      ),
    );
  }

  Widget _buildWifiNetworkCard(BuildContext context, int index) {
    // Sample WiFi network names
    final networkNames = [
      'ABCDEFGH',
      'HomeNetwork_5G',
      'Office_WiFi',
      'Cafe_Express',
      'Library_Public',
      'Hotel_Guest',
      'Airport_Free',
      'Restaurant_Zone',
      'Mall_WiFi',
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          networkNames[index],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(Icons.wifi, color: Colors.grey, size: 24),
        onTap: () {
          // Navigate to WiFi setup page when a network is selected
          context.push('/wifi-setup');
        },
      ),
    );
  }
}
