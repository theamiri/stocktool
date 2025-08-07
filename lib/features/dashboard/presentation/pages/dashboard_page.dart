import 'package:flutter/material.dart';
import '../../../../core/theme/index.dart';
import 'dashboard_list_view.dart';
import 'dashboard_grid_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isListView = true; // true for list view, false for grid view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with user info and view switcher
            _buildHeader(),

            // Main content area
            Expanded(
              child: _isListView
                  ? const DashboardListView()
                  : const DashboardGridView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Top row with menu and view switcher
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Menu icon
                IconButton(
                  onPressed: () {
                    // TODO: Open menu
                  },
                  icon: const Icon(Icons.menu, color: Colors.white, size: 24),
                ),

                // View switcher
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildViewToggleButton(
                        icon: Icons.list,
                        isSelected: _isListView,
                        onTap: () {
                          setState(() {
                            _isListView = true;
                          });
                        },
                      ),
                      _buildViewToggleButton(
                        icon: Icons.grid_view,
                        isSelected: !_isListView,
                        onTap: () {
                          setState(() {
                            _isListView = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // User profile section
            Column(
              children: [
                // User avatar
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 12),

                // User name
                const Text(
                  'ROD POP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                // User email
                const Text(
                  'rodxxx@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewToggleButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.primary : Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
