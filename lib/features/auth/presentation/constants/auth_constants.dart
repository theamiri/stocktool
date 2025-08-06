import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class AuthConstants {
  // Colors
  static const Color primaryGold = AppTheme.primaryGold;
  static const Color backgroundColor = AppTheme.backgroundColor;
  static const Color textColor = AppTheme.textColor;

  // Text
  static const String appTitle = 'STOCK TOOLS';
  static const String appSubtitle = 'Easy is Better';

  // Dimensions
  static const double logoSize = 120.0; // Same as splash screen
  static const double buttonHeight = AppTheme.buttonHeight;
  static const double inputBorderRadius = AppTheme.inputBorderRadius;

  // Spacing
  static const double logoBottomSpacing = AppTheme.paddingExtraLarge;
  static const double titleBottomSpacing = AppTheme.paddingSmall;
  static const double fieldSpacing = AppTheme.paddingMedium;
  static const double buttonTopSpacing = AppTheme.paddingExtraLarge;
  static const double separatorSpacing = AppTheme.paddingHuge;
}
