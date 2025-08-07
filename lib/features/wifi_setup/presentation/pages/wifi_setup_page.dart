import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../constants/wifi_setup_constants.dart';

class WifiSetupPage extends StatefulWidget {
  const WifiSetupPage({super.key});

  @override
  State<WifiSetupPage> createState() => _WifiSetupPageState();
}

class _WifiSetupPageState extends State<WifiSetupPage> {
  final TextEditingController _networkController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _networkController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button
            Container(
              color: WifiSetupConstants.primaryGold,
              child: Padding(
                padding: const EdgeInsets.all(WifiSetupConstants.padding),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            WifiSetupConstants.stockToolsIconPath,
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(height: WifiSetupConstants.padding),
                          const Text(
                            WifiSetupConstants.appName,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: WifiSetupConstants.textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            WifiSetupConstants.tagline,
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: WifiSetupConstants.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: WifiSetupConstants.extraLargePadding,
                    ),

                    // Network input field
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: WifiSetupConstants.primaryGold,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(
                          WifiSetupConstants.buttonBorderRadius,
                        ),
                      ),
                      child: TextField(
                        controller: _networkController,
                        decoration: InputDecoration(
                          hintText: WifiSetupConstants.networkFieldHint,
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(
                            Icons.wifi,
                            color: Colors.grey,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: WifiSetupConstants.padding,
                            vertical: WifiSetupConstants.padding,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: WifiSetupConstants.padding),

                    // Password input field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(
                          WifiSetupConstants.buttonBorderRadius,
                        ),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: WifiSetupConstants.passwordFieldHint,
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
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
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: WifiSetupConstants.padding,
                            vertical: WifiSetupConstants.padding,
                          ),
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
                        onPressed: () {
                          context.push('/wifi-connected');
                        },
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
