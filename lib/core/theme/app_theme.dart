import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryGold = Color(0xFFE6A72C);
  static const Color lightGold = Color(0xFFF7D794);
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;
  static const Color headerTextColor = Colors.white;
  static const Color cardBackgroundColor = Colors.white;
  static const Color cardTextColor = Colors.grey;
  static const Color inactiveFieldColor = Color(0xFFF5F5F5);
  static const Color borderColor = Color(0xFFE0E0E0);

  // Text Styles
  static const TextStyle appTitleStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: textColor,
    letterSpacing: 2.0,
  );

  static const TextStyle appSubtitleStyle = TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
    color: textColor,
  );

  static const TextStyle userNameStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: headerTextColor,
  );

  static const TextStyle userEmailStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: headerTextColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: headerTextColor,
  );

  static const TextStyle cardTitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: cardTextColor,
  );

  static const TextStyle linkTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: primaryGold,
  );

  static const TextStyle hintTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  // Dimensions
  static const double logoSize = 120.0;
  static const double smallLogoSize = 40.0;
  static const double buttonHeight = 50.0;
  static const double cardHeight = 120.0;
  static const double headerHeight = 200.0;
  static const double inputBorderRadius = 12.0;
  static const double cardBorderRadius = 12.0;

  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 20.0;
  static const double paddingExtraLarge = 24.0;
  static const double paddingHuge = 32.0;

  // Shadows
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.grey.withValues(alpha: 0.1),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.1),
      spreadRadius: 1,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  // Input Decoration
  static InputDecoration inputDecoration({
    String? hintText,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Colors.grey)
          : null,
      suffixIcon: suffixIcon,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: paddingMedium,
        vertical: paddingMedium,
      ),
    );
  }

  // Button Styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryGold,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(inputBorderRadius),
    ),
    padding: const EdgeInsets.symmetric(vertical: paddingMedium),
  );

  // Container Decorations
  static BoxDecoration inputContainerDecoration({
    Color? backgroundColor,
    Color? borderColor,
    bool isFocused = false,
  }) {
    return BoxDecoration(
      color:
          backgroundColor ??
          (isFocused ? cardBackgroundColor : inactiveFieldColor),
      borderRadius: BorderRadius.circular(inputBorderRadius),
      border: Border.all(
        color: borderColor ?? (isFocused ? primaryGold : AppTheme.borderColor),
        width: 1,
      ),
    );
  }

  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardBackgroundColor,
    borderRadius: BorderRadius.circular(cardBorderRadius),
    boxShadow: cardShadow,
  );

  static BoxDecoration headerDecoration = const BoxDecoration(
    color: primaryGold,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
  );
}
