import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../constants/splash_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/index.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isFirebaseInitialized = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initializeFirebaseAndNavigate();
  }

  Future<void> _initializeFirebaseAndNavigate() async {
    try {
      // Wait for platform to be ready
      await Future.delayed(const Duration(milliseconds: 500));

      setState(() {
        _isFirebaseInitialized = true;
      });

      // Give Firebase auth time to resolve, then check BLoC state
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        final authBloc = context.read<AuthBloc>();
        final authState = authBloc.state;
        
        print('🚀 Splash timeout - Auth state: ${authState.runtimeType}');
        
        // If still AuthInitial after timeout, force navigation to login
        if (authState is AuthInitial) {
          print('⚠️ Auth state still initial, navigating to login');
          context.go('/login');
        } else if (authState is Authenticated) {
          print('✅ User authenticated, navigating to dashboard');
          context.go('/dashboard');
        } else if (authState is Unauthenticated) {
          print('❌ User not authenticated, navigating to login');
          context.go('/login');
        }
      }
    } catch (e) {
      print('Splash initialization error: $e');
      setState(() {
        _error = e.toString();
      });

      // Navigate to login on error
      if (mounted) {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: SvgPicture.asset(
                'assets/svgs/mesh.svg',
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppTheme.primaryGold,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                AppLogo(
                  width: SplashConstants.logoSize,
                  height: SplashConstants.logoSize,
                ),

                SizedBox(height: SplashConstants.subtitleBottomSpacing),

                // Location text
                Text(
                  SplashConstants.locationText,
                  style: TextStyle(
                    fontSize: SplashConstants.locationFontSize,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.textColor,
                    letterSpacing: 4.0,
                  ),
                ),

                // Loading indicator if Firebase is initializing
                if (!_isFirebaseInitialized && _error == null) ...[
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppTheme.primaryGold,
                      ),
                    ),
                  ),
                ],

                // Error message if Firebase failed
                if (_error != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    'Initialization failed',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
