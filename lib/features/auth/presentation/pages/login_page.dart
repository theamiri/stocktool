import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Top section with logo and branding
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: AppLogo(width: 180, height: 180),
              ),
              // Form section
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    // Email field
                    CustomTextField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 16),

                    // Password field
                    CustomTextField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
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
                    const SizedBox(height: 8),

                    // Forgot password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Navigate to forgot password
                        },
                        child: Text(
                          'Forgot Password?',
                          style: AppTheme.hintTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Login button
                    PrimaryButton(
                      text: 'Login',
                      onPressed: () {
                        // TODO: Handle login validation
                        context.go('/dashboard');
                      },
                    ),
                    const SizedBox(height: 32),

                    // OR separator
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: AppTheme.borderColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.paddingMedium,
                          ),
                          child: Text(
                            'OR',
                            style: AppTheme.hintTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: AppTheme.borderColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Social login buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialLoginButton(
                          icon: 'assets/svgs/facebook_icon.svg',
                          onPressed: () {
                            // TODO: Handle Facebook login
                          },
                        ),
                        SocialLoginButton(
                          icon: 'assets/svgs/google_icon.svg',
                          onPressed: () {
                            // TODO: Handle Google login
                          },
                        ),
                        SocialLoginButton(
                          icon: 'assets/svgs/microsoft_icon.svg',
                          onPressed: () {
                            // TODO: Handle Microsoft login
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Bottom registration link
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account? ", style: AppTheme.hintTextStyle),
                    GestureDetector(
                      onTap: () {
                        context.go('/signup');
                      },
                      child: Text(
                        'Register Now',
                        style: AppTheme.linkTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
