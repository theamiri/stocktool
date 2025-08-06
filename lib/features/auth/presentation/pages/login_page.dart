import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/social_login_button.dart';
import '../../../../core/theme/app_theme.dart';

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
                child: Image.asset(
                  'assets/images/app_logo.png',
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
              // Form section
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    // Email field
                    Container(
                      decoration: AppTheme.inputContainerDecoration(
                        isFocused: _emailFocusNode.hasFocus,
                        backgroundColor:
                            _emailController.text.isEmpty &&
                                !_emailFocusNode.hasFocus
                            ? AppTheme.inactiveFieldColor
                            : AppTheme.cardBackgroundColor,
                      ),
                      child: TextField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        onTap: () => setState(() {}),
                        onChanged: (value) => setState(() {}),
                        decoration: AppTheme.inputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icons.email,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password field
                    Container(
                      decoration: AppTheme.inputContainerDecoration(
                        isFocused: _passwordFocusNode.hasFocus,
                        backgroundColor:
                            _passwordController.text.isEmpty &&
                                !_passwordFocusNode.hasFocus
                            ? AppTheme.inactiveFieldColor
                            : AppTheme.cardBackgroundColor,
                      ),
                      child: TextField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        onTap: () => setState(() {}),
                        onChanged: (value) => setState(() {}),
                        obscureText: !_isPasswordVisible,
                        decoration: AppTheme.inputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icons.lock,
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
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Handle login validation
                          context.go('/dashboard');
                        },
                        style: AppTheme.primaryButtonStyle,
                        child: Text('Login', style: AppTheme.buttonTextStyle),
                      ),
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
