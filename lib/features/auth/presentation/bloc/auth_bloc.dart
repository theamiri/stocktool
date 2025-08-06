import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/either.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/logging/logger.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/usecases/usecase.dart';

// Events
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  SignUpRequested(this.email, this.password, this.firstName, this.lastName);

  @override
  List<Object?> get props => [email, password, firstName, lastName];
}

class SignOutRequested extends AuthEvent {}

class AuthStateChanged extends AuthEvent {
  final User? user;

  AuthStateChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthErrorOccurred extends AuthEvent {
  final String message;

  AuthErrorOccurred(this.message);

  @override
  List<Object?> get props => [message];
}

// States
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final AuthRepository _authRepository;
  late StreamSubscription<Either<Failure, User?>> _authStateSubscription;

  AuthBloc({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
    required this.getCurrentUserUseCase,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository,
       super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<AuthStateChanged>(_onAuthStateChanged);
    on<AuthErrorOccurred>(_onAuthErrorOccurred);

    // Listen to Firebase auth state changes
    _authStateSubscription = _authRepository.authStateChanges.listen((either) {
      either.fold(
        (failure) {
          Logger.authError('Firebase auth error: ${failure.message}');
          add(AuthErrorOccurred(failure.message));
        },
        (user) {
          Logger.auth('Firebase auth state changed: ${user?.email ?? 'null'}');
          if (user != null) {
            add(AuthStateChanged(user));
          } else {
            add(AuthStateChanged(null));
          }
        },
      );
    });

    // Check initial auth state
    add(AuthCheckRequested());
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    Logger.auth('AuthCheckRequested - checking current user...');
    final result = await getCurrentUserUseCase(const NoParams());
    result.fold(
      (failure) {
        Logger.authError('Auth check failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (user) {
        if (user != null) {
          Logger.auth('User found: ${user.email}');
          emit(Authenticated(user));
        } else {
          Logger.auth('No user found');
          emit(Unauthenticated());
        }
      },
    );
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signInUseCase(
      SignInParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) {
        Logger.authError('Sign in failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (user) {
        Logger.auth('Sign in successful: ${user.email}');
        emit(Authenticated(user));
      },
    );
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signUpUseCase(
      SignUpParams(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
      ),
    );

    result.fold(
      (failure) {
        Logger.authError('Sign up failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (user) {
        Logger.auth('Sign up successful: ${user.email}');
        emit(Authenticated(user));
      },
    );
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signOutUseCase(const NoParams());

    result.fold(
      (failure) {
        Logger.authError('Sign out failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (_) {
        Logger.auth('Sign out successful');
        emit(Unauthenticated());
      },
    );
  }

  void _onAuthStateChanged(AuthStateChanged event, Emitter<AuthState> emit) {
    if (event.user != null) {
      Logger.auth('Emitting Authenticated state for: ${event.user!.email}');
      emit(Authenticated(event.user!));
    } else {
      Logger.auth('Emitting Unauthenticated state');
      emit(Unauthenticated());
    }
  }

  void _onAuthErrorOccurred(AuthErrorOccurred event, Emitter<AuthState> emit) {
    emit(AuthError(event.message));
  }

  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }
}
