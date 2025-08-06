import 'dart:async';
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
  bool _hasNavigated = false; // Prevent navigation race condition
  String? _error;
  Timer? _timeoutTimer;

  @override
  void initState() {
    super.initState();
    _initializeAppAndWaitForAuth();
  }

  Future<void> _initializeAppAndWaitForAuth() async {
    try {
      // Wait for platform to be ready
      await Future.delayed(const Duration(milliseconds: 500));

      setState(() {
        _isFirebaseInitialized = true;
      });

      // Set a maximum wait time for auth state resolution
      _setupAuthTimeoutFallback();
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  void _setupAuthTimeoutFallback() {
    // Fallback navigation after timeout if no auth state change occurs
    _timeoutTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && !_hasNavigated) {
        final authBloc = context.read<AuthBloc>();
        final authState = authBloc.state;

        // Only navigate if still in initial state (auth stream didn't fire)
        if (authState is AuthInitial) {
          _navigateToLogin();
        }
      }
    });
  }

  @override
  void dispose() {
    _timeoutTimer?.cancel();
    super.dispose();
  }

  void _navigateToLogin() {
    if (mounted && !_hasNavigated) {
      _hasNavigated = true;
      context.go('/login');
    }
  }

  void _navigateToDashboard() {
    if (mounted && !_hasNavigated) {
      _hasNavigated = true;
      context.go('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Handle auth state changes to prevent race conditions
        if (state is Authenticated) {
          _navigateToDashboard();
        } else if (state is Unauthenticated) {
          _navigateToLogin();
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
