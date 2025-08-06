import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/auth_constants.dart';

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
      backgroundColor: AuthConstants.backgroundColor,
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
                      decoration: BoxDecoration(
                        color:
                            _firstNameController.text.isEmpty &&
                                !_firstNameFocusNode.hasFocus
                            ? Colors.grey[100]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _firstNameFocusNode.hasFocus
                              ? AuthConstants.primaryGold
                              : Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _firstNameController,
                        focusNode: _firstNameFocusNode,
                        onTap: () => setState(() {}),
                        onChanged: (value) => setState(() {}),
                        decoration: const InputDecoration(
                          hintText: 'First Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Last Name field
                    Container(
                      decoration: BoxDecoration(
                        color:
                            _lastNameController.text.isEmpty &&
                                !_lastNameFocusNode.hasFocus
                            ? Colors.grey[100]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _lastNameFocusNode.hasFocus
                              ? AuthConstants.primaryGold
                              : Colors.grey[300]!,
                          width: 1,
                        ),
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
                      decoration: BoxDecoration(
                        color:
                            _emailController.text.isEmpty &&
                                !_emailFocusNode.hasFocus
                            ? Colors.grey[100]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _emailFocusNode.hasFocus
                              ? AuthConstants.primaryGold
                              : Colors.grey[300]!,
                          width: 1,
                        ),
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
                      decoration: BoxDecoration(
                        color:
                            _passwordController.text.isEmpty &&
                                !_passwordFocusNode.hasFocus
                            ? Colors.grey[100]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _passwordFocusNode.hasFocus
                              ? AuthConstants.primaryGold
                              : Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        onTap: () => setState(() {}),
                        onChanged: (value) => setState(() {}),
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
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
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
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
                          // TODO: Handle signup
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AuthConstants.primaryGold,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                    const Text(
                      'Already have account? ',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go('/login');
                      },
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                          color: AuthConstants.primaryGold,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
