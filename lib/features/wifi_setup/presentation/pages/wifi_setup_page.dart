import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stocktool/core/theme/app_theme.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../constants/wifi_setup_constants.dart';

class WifiSetupPage extends StatefulWidget {
  final String? selectedNetworkName;

  const WifiSetupPage({super.key, this.selectedNetworkName});

  @override
  State<WifiSetupPage> createState() => _WifiSetupPageState();
}

class _WifiSetupPageState extends State<WifiSetupPage> {
  final TextEditingController _networkController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _networkFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = false;
  bool _isPasswordValid = false;

  // Password validation regex - allows letters, numbers, and special characters
  static const String _passwordRegex = r'^.{8,}$';

  @override
  void initState() {
    super.initState();
    // Pre-fill network name if provided
    if (widget.selectedNetworkName != null &&
        widget.selectedNetworkName!.isNotEmpty) {
      _networkController.text = widget.selectedNetworkName!;
      print('Network name set: ${widget.selectedNetworkName}');
    } else {
      print('No network name provided');
    }

    // Add listener for password validation
    _passwordController.addListener(_validatePassword);
  }

  @override
  void dispose() {
    _networkController.dispose();
    _passwordController.dispose();
    _networkFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _validatePassword() {
    final password = _passwordController.text;
    final isValid = RegExp(_passwordRegex).hasMatch(password);
    setState(() {
      _isPasswordValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WifiSetupConstants.primaryGold,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // App branding
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(
                  WifiSetupConstants.extraLargePadding,
                ),
                child: Column(
                  children: [
                    // App logo and name
                    Center(
                      child: Image.asset(
                        'assets/images/app_logo.png',
                        width: 180,
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(
                      height: WifiSetupConstants.extraLargePadding,
                    ),

                    // Network input field
                    CustomTextField(
                      controller: _networkController,
                      focusNode: _networkFocusNode,
                      hintText: WifiSetupConstants.networkFieldHint,
                      prefixIcon: Icons.wifi,
                      onChanged: (value) {
                        print('Network field changed: $value');
                      },
                    ),

                    const SizedBox(height: WifiSetupConstants.padding),

                    // Password input field
                    CustomTextField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      hintText: WifiSetupConstants.passwordFieldHint,
                      prefixIcon: Icons.lock,
                      obscureText: !_isPasswordVisible,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Password validation indicator
                          if (_passwordController.text.isNotEmpty)
                            Icon(
                              _isPasswordValid
                                  ? Icons.check_circle
                                  : Icons.error,
                              color: _isPasswordValid
                                  ? Colors.green
                                  : Colors.red,
                              size: 20,
                            ),
                          const SizedBox(width: 8),
                          // Password visibility toggle
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Password validation message
                    if (_passwordController.text.isNotEmpty &&
                        !_isPasswordValid)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 16),
                        child: Text(
                          'Password must be at least 8 characters long',
                          style: TextStyle(
                            color: Colors.red[600],
                            fontSize: 12,
                          ),
                        ),
                      ),

                    const SizedBox(
                      height: WifiSetupConstants.extraLargePadding,
                    ),

                    // Next button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isPasswordValid
                            ? () {
                                context.push('/wifi-connected');
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: WifiSetupConstants.primaryGold,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: WifiSetupConstants.padding,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              WifiSetupConstants.buttonBorderRadius,
                            ),
                          ),
                        ),
                        child: Text(
                          WifiSetupConstants.nextButtonText,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
