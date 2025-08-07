import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';
import '../../../../core/theme/index.dart';
import '../../../../shared/widgets/index.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/app_logo.png',
                          height: 200,
                          width: 200,
                        ),
                      ],
                    ),
                  ),

                  // Form section
                  Column(
                    children: [
                      // First Name field
                      CustomTextField(
                        controller: _firstNameController,
                        focusNode: _firstNameFocusNode,
                        hintText: 'First Name',
                      ),
                      const SizedBox(height: 16),

                      // Last Name field
                      CustomTextField(
                        controller: _lastNameController,
                        focusNode: _lastNameFocusNode,
                        hintText: 'Last Name',
                      ),
                      const SizedBox(height: 16),

                      // Email field
                      CustomTextField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 16),

                      // Password field
                      CustomTextField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        hintText: 'Password',
                        obscureText: !_isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Sign up button
                      PrimaryButton(
                        text: 'SIGN UP',
                        onPressed: () {
                          // TODO: Handle signup validation
                        },
                      ),
                    ],
                  ),

                  // Bottom login link
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32, top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account? ',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login Now',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw hexagon
    for (int i = 0; i < 6; i++) {
      final angle = i * 60 * 3.14159 / 180;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);

    // Draw abacus icon (white)
    final abacusPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw vertical bars
    final barWidth = size.width * 0.08;
    final barHeight = size.height * 0.6;
    final barSpacing = size.width * 0.15;

    // Left bar
    canvas.drawRect(
      Rect.fromLTWH(
        center.dx - barSpacing - barWidth / 2,
        center.dy - barHeight / 2,
        barWidth,
        barHeight,
      ),
      abacusPaint,
    );

    // Right bar
    canvas.drawRect(
      Rect.fromLTWH(
        center.dx + barSpacing - barWidth / 2,
        center.dy - barHeight / 2,
        barWidth,
        barHeight,
      ),
      abacusPaint,
    );

    // Draw beads (3 rows)
    final beadSize = size.width * 0.06;
    final beadSpacing = size.width * 0.12;
    final rowSpacing = size.height * 0.15;

    for (int row = 0; row < 3; row++) {
      final y = center.dy - rowSpacing + row * rowSpacing;

      // Top row: 4 beads
      for (int bead = 0; bead < 4; bead++) {
        final x = center.dx - beadSpacing * 1.5 + bead * beadSpacing;
        canvas.drawCircle(Offset(x, y), beadSize, abacusPaint);
      }

      // Middle row: 3 beads
      for (int bead = 0; bead < 3; bead++) {
        final x = center.dx - beadSpacing + bead * beadSpacing;
        canvas.drawCircle(Offset(x, y), beadSize, abacusPaint);
      }

      // Bottom row: 4 beads
      for (int bead = 0; bead < 4; bead++) {
        final x = center.dx - beadSpacing * 1.5 + bead * beadSpacing;
        canvas.drawCircle(Offset(x, y), beadSize, abacusPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
