import 'package:flutter/material.dart';
import 'dashboard_view1_page.dart';
import 'dashboard_view2_page.dart';
import '../../../../core/theme/app_theme.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isView1 = true; // true for view 1, false for view 2

  void _toggleView() {
    setState(() {
      _isView1 = !_isView1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          // Main dashboard view
          _isView1 ? const DashboardView1Page() : const DashboardView2Page(),

          // Theme switcher button
          Positioned(
            top: 60,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryGold,
                borderRadius: BorderRadius.circular(25),
                boxShadow: AppTheme.buttonShadow,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _toggleView,
                  borderRadius: BorderRadius.circular(25),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _isView1 ? Icons.grid_view : Icons.list,
                          color: AppTheme.headerTextColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isView1 ? 'Grid' : 'List',
                          style: AppTheme.buttonTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
