import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';

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
  bool _isPasswordVisible = false;
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

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
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/login'),
        ),
      ),
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
                    // First Name field
                    Container(
                      decoration: AppTheme.inputContainerDecoration(
                        isFocused: _firstNameFocusNode.hasFocus,
                        backgroundColor:
                            _firstNameController.text.isEmpty &&
                                !_firstNameFocusNode.hasFocus
                            ? AppTheme.inactiveFieldColor
                            : AppTheme.cardBackgroundColor,
                      ),
                      child: TextField(
                        controller: _firstNameController,
                        focusNode: _firstNameFocusNode,
                        onTap: () => setState(() {}),
                        onChanged: (value) => setState(() {}),
                        decoration: AppTheme.inputDecoration(
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Last Name field
                    Container(
                      decoration: AppTheme.inputContainerDecoration(
                        isFocused: _lastNameFocusNode.hasFocus,
                        backgroundColor:
                            _lastNameController.text.isEmpty &&
                                !_lastNameFocusNode.hasFocus
                            ? AppTheme.inactiveFieldColor
                            : AppTheme.cardBackgroundColor,
                      ),
                      child: TextField(
                        controller: _lastNameController,
                        focusNode: _lastNameFocusNode,
                        onTap: () => setState(() {}),
                        onChanged: (value) => setState(() {}),
                        decoration: const InputDecoration(
                          hintText: 'Last Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

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
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
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
                    const SizedBox(height: 32),

                    // Sign up button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Handle signup validation
                          context.go('/dashboard');
                        },
                        style: AppTheme.primaryButtonStyle,
                        child: Text('SIGN UP', style: AppTheme.buttonTextStyle),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom login link
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account? ',
                      style: AppTheme.hintTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/login');
                      },
                      child: Text('Login Now', style: AppTheme.linkTextStyle),
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
