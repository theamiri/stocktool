import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onTap,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.inputContainerDecoration(
        isFocused: widget.focusNode.hasFocus,
        backgroundColor:
            widget.controller.text.isEmpty && !widget.focusNode.hasFocus
            ? AppTheme.inactiveFieldColor
            : AppTheme.cardBackgroundColor,
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        onTap: widget.onTap ?? () => setState(() {}),
        onChanged: widget.onChanged ?? (value) => setState(() {}),
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        decoration: AppTheme.inputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
