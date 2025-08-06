import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import '../bloc/auth_bloc.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user.dart';

class AuthWrapper extends StatefulWidget {
  final Widget child;

  const AuthWrapper({super.key, required this.child});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  AuthRepositoryImpl? _authRepository;
  Stream<User?>? _authStream;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeAuth();
  }

  Future<void> _initializeAuth() async {
    try {
      // Ensure Firebase is initialized
      await Firebase.initializeApp();
      print('Firebase initialized in AuthWrapper');

      // Wait a bit for platform to be ready
      await Future.delayed(const Duration(milliseconds: 100));

      _authRepository = AuthRepositoryImpl();
      _authStream = _authRepository!.authStateChanges;
      _listenToAuthChanges();
      _isInitialized = true;
    } catch (e) {
      print('Auth initialization error: $e');
      // If auth fails to initialize, set as unauthenticated
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<AuthBloc>().emit(Unauthenticated());
        }
      });
    }
  }

  void _listenToAuthChanges() {
    if (_authStream != null) {
      _authStream!.listen(
        (User? user) {
          if (mounted) {
            if (user != null) {
              context.read<AuthBloc>().emit(Authenticated(user));
            } else {
              context.read<AuthBloc>().emit(Unauthenticated());
            }
          }
        },
        onError: (error) {
          print('Auth state change error: $error');
          if (mounted) {
            context.read<AuthBloc>().emit(Unauthenticated());
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: widget.child,
    );
  }
}
