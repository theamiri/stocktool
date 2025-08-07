import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/index.dart';

class DashboardCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onPressed;

  const DashboardCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          SvgPicture.asset(
            iconPath,
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(
              Color(
                0xFF666666,
              ), // Grey color to make icons visible on white cards
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 12),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(
                0xFF666666,
              ), // Grey color for better contrast on white cards
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
