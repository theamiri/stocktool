import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 12),
                Text(
                  'AUSTRALIA',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                    letterSpacing: 2.0,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -40,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/svgs/mesh.svg'),
          ),
        ],
      ),
    );
  }
}
