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
  String? _error;
  Timer? _initTimer;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      _initTimer = Timer(const Duration(milliseconds: 1500), () {
        if (mounted) {
          setState(() {
            _isFirebaseInitialized = true;
          });
        }
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  @override
  void dispose() {
    _initTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Only navigate if we're actually on the splash page
        // This prevents navigation during hot reload when user is on other pages
        final currentRoute = GoRouterState.of(context).matchedLocation;
        if (currentRoute != '/') {
          return; // Don't navigate if we're not on splash page
        }

        if (state is Authenticated) {
          context.go('/dashboard');
        } else if (state is Unauthenticated) {
          context.go('/login');
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
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(
                  width: SplashConstants.logoSize,
                  height: SplashConstants.logoSize,
                ),
                SizedBox(height: SplashConstants.subtitleBottomSpacing),
                Text(
                  SplashConstants.locationText,
                  style: TextStyle(
                    fontSize: SplashConstants.locationFontSize,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.textColor,
                    letterSpacing: 4.0,
                  ),
                ),
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
