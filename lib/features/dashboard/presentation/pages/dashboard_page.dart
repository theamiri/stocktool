import 'package:flutter/material.dart';
import '../constants/dashboard_constants.dart';
import 'dashboard_view1_page.dart';
import 'dashboard_view2_page.dart';

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
      backgroundColor: DashboardConstants.backgroundColor,
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
                color: DashboardConstants.primaryGold,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
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
                          color: DashboardConstants.headerTextColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isView1 ? 'Grid' : 'List',
                          style: const TextStyle(
                            color: DashboardConstants.headerTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
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
