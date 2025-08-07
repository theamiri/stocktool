import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/dashboard_constants.dart';
import '../../../../core/theme/app_theme.dart';

class DashboardButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onPressed;

  const DashboardButton({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DashboardConstants.buttonHeight,
      decoration: BoxDecoration(
        color: AppTheme.primaryGold,
        borderRadius: BorderRadius.circular(AppTheme.inputBorderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // Icon
                SvgPicture.asset(iconPath, width: 24, height: 24),
                const SizedBox(width: 16),

                // Title
                Text(title, style: AppTheme.buttonTextStyle),
                const Spacer(),

                // Arrow icon
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.headerTextColor,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
