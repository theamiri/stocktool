import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Widget? child;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppTheme.buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppTheme.primaryButtonStyle,
        child: child ?? Text(text, style: AppTheme.buttonTextStyle),
      ),
    );
  }
}
