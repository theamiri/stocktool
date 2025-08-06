import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/dashboard_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/logging/logger.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.headerHeight,
      decoration: AppTheme.headerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingLarge),
        child: Column(
          children: [
            // Top row with menu and user info
            Row(
              children: [
                // Menu icon
                Icon(Icons.menu, color: AppTheme.headerTextColor, size: 24),
                const Spacer(),
                // User profile icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppTheme.headerTextColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: AppTheme.primaryGold,
                    size: 30,
                  ),
                ),
                const Spacer(),
                // Logout button
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: IconButton(
                    onPressed: () {
                      Logger.auth('User initiated logout from dashboard');
                      context.read<AuthBloc>().add(SignOutRequested());
                      // No need for manual navigation - GoRouter will handle it automatically
                    },
                    icon: Icon(
                      Icons.logout,
                      color: AppTheme.headerTextColor,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // User name and email
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Column(
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Loading...', style: AppTheme.userEmailStyle),
                    ],
                  );
                } else if (state is Authenticated) {
                  return Column(
                    children: [
                      Text(
                        'Welcome, ${state.user.firstName ?? 'User'}!',
                        style: AppTheme.userNameStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(state.user.email, style: AppTheme.userEmailStyle),
                    ],
                  );
                } else {
                  // Fallback to constants if not authenticated
                  return Column(
                    children: [
                      Text(
                        DashboardConstants.userName,
                        style: AppTheme.userNameStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        DashboardConstants.userEmail,
                        style: AppTheme.userEmailStyle,
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
