import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shared/widgets/index.dart';

class WifiPasswordPage extends StatefulWidget {
  const WifiPasswordPage({super.key});

  @override
  State<WifiPasswordPage> createState() => _WifiPasswordPageState();
}

class _WifiPasswordPageState extends State<WifiPasswordPage> {
  final TextEditingController _networkController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _networkFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get the selected network name from arguments
    final String? networkName =
        ModalRoute.of(context)?.settings.arguments as String?;
    if (networkName != null && _networkController.text.isEmpty) {
      _networkController.text = networkName;
    }
  }

  @override
  void dispose() {
    _networkController.dispose();
    _passwordController.dispose();
    _networkFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Main content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Logo and branding
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Image.asset(
                          'assets/images/app_logo.png',
                          width: 200,
                          height: 200,
                        ),
                      ),

                      // Input fields
                      Column(
                        children: [
                          // Network field
                          CustomTextField(
                            controller: _networkController,
                            focusNode: _networkFocusNode,
                            hintText: 'Network',
                            prefixIcon: Icons.wifi,
                          ),

                          const SizedBox(height: 16),

                          // Password field
                          CustomTextField(
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            hintText: 'Password',
                            prefixIcon: Icons.lock,
                            obscureText: true,
                          ),
                        ],
                      ),

                      const SizedBox(height: 27),

                      // Next button
                      PrimaryButton(
                        text: 'Next',
                        onPressed: () {
                          // Navigate to connected screen
                          Navigator.pushNamed(context, '/wifi-connected');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
