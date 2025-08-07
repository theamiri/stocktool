import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Golden Yellow/Orange from the design
  static const Color primary = Color(0xFFE6A72C); // Golden yellow/orange from screenshot
  static const Color primaryLight = Color(0xFFFFCC80);
  static const Color primaryDark = Color(0xFFFF8F00);
  static const Color primaryVariant = Color(
    0xFFFFA726,
  ); // Slightly different shade

  // Background Colors
  static const Color background = Color(0xFFFFFFFF); // Pure white background
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Dark grey/black text
  static const Color textSecondary = Color(0xFF757575);
  static const Color textOnPrimary = Color(
    0xFFFFFFFF,
  ); // White text on golden background
  static const Color textOnDark = Color(
    0xFFFFFFFF,
  ); // White text on dark backgrounds

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFE0E0E0);

  // Icon Colors
  static const Color iconPrimary = Color(0xFF212121);
  static const Color iconSecondary = Color(0xFF757575);
  static const Color iconOnPrimary = Color(
    0xFFFFFFFF,
  ); // White icons on golden background

  // Button Colors
  static const Color buttonPrimary = Color(0xFFFFB74D); // Golden buttons
  static const Color buttonPrimaryPressed = Color(0xFFFF8F00);
  static const Color buttonSecondary = Color(0xFFF5F5F5);
  static const Color buttonSecondaryPressed = Color(0xFFE0E0E0);

  // Input Colors
  static const Color inputBackground = Color(0xFFF5F5F5);
  static const Color backgroundSecondary = Color(0xFFF5F5F5);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputFocused = Color(0xFFFFB74D);

  // Header Colors
  static const Color headerBackground = Color(0xFFFFB74D); // Golden header
  static const Color headerText = Color(0xFFFFFFFF);

  // Card Colors
  static const Color cardBorder = Color(0xFFFFB74D);
  static const Color cardShadow = Color(0x1A000000);

  // QR Code Scanner Colors
  static const Color scannerOverlay = Color(0x80000000);
  static const Color scannerFrame = Color(0xFFFFB74D);

  // Logo Colors
  static const Color logoBackground = Color(0xFFFFB74D); // Golden hexagon
  static const Color logoIcon = Color(0xFFFFFFFF); // White abacus icon
}
