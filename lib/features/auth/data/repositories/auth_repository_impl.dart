import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../../../../core/error/either.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/logging/logger.dart';
import '../../../../shared/utils/error_handler.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  firebase_auth.FirebaseAuth? _firebaseAuth;

  AuthRepositoryImpl({firebase_auth.FirebaseAuth? firebaseAuth}) {
    _firebaseAuth = firebaseAuth;
  }

  firebase_auth.FirebaseAuth get _auth {
    if (_firebaseAuth == null) {
      _firebaseAuth = firebase_auth.FirebaseAuth.instance;
    }
    return _firebaseAuth!;
  }

  @override
  Stream<Either<Failure, User?>> get authStateChanges {
    try {
      return _auth
          .authStateChanges()
          .map((firebaseUser) {
            Logger.auth(
              'Firebase user changed: ${firebaseUser?.email ?? 'null'}',
            );
            return firebaseUser != null
                ? Right<Failure, User?>(_mapFirebaseUserToUser(firebaseUser))
                : const Right<Failure, User?>(null);
          })
          .handleError((error) {
            Logger.authError('Firebase Auth state change error', error: error);
            return Left<Failure, User?>(AuthFailure(error.toString()));
          });
    } catch (e) {
      Logger.authError('Error getting auth state changes', error: e);
      return Stream.value(Left<Failure, User?>(AuthFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, User?>> get currentUser async {
    try {
      final firebaseUser = _auth.currentUser;
      return firebaseUser != null
          ? Right<Failure, User?>(_mapFirebaseUserToUser(firebaseUser))
          : const Right<Failure, User?>(null);
    } catch (e) {
      Logger.authError('Error getting current user', error: e);
      return Left<Failure, User?>(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        return const Left<Failure, User>(AuthFailure('Sign in failed'));
      }

      return Right<Failure, User>(_mapFirebaseUserToUser(credential.user!));
    } catch (e) {
      Logger.authError('Sign in failed', error: e);
      return Left<Failure, User>(AuthFailure(ErrorHandler.getDisplayError(e)));
    }
  }

  @override
  Future<Either<Failure, User>> createUserWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        return const Left<Failure, User>(AuthFailure('User creation failed'));
      }

      // Update display name
      await credential.user!.updateDisplayName('$firstName $lastName');

      return Right<Failure, User>(_mapFirebaseUserToUser(credential.user!));
    } catch (e) {
      Logger.authError('User creation failed', error: e);
      return Left<Failure, User>(AuthFailure(ErrorHandler.getDisplayError(e)));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _auth.signOut();
      return const Right<Failure, void>(null);
    } catch (e) {
      Logger.authError('Sign out error', error: e);
      return Left<Failure, void>(AuthFailure(ErrorHandler.getDisplayError(e)));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        AuthFailure('Password reset failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateUserProfile({
    String? firstName,
    String? lastName,
    String? displayName,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Left<Failure, void>(AuthFailure('No user logged in'));
      }

      if (displayName != null) {
        await user.updateDisplayName(displayName);
      }

      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        AuthFailure('Profile update failed: ${e.toString()}'),
      );
    }
  }

  User _mapFirebaseUserToUser(firebase_auth.User firebaseUser) {
    final displayName = firebaseUser.displayName;
    String? firstName, lastName;

    if (displayName != null && displayName.contains(' ')) {
      final nameParts = displayName.split(' ');
      firstName = nameParts.first;
      lastName = nameParts.skip(1).join(' ');
    }

    return User(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      firstName: firstName,
      lastName: lastName,
      displayName: displayName,
      createdAt: firebaseUser.metadata.creationTime,
      lastLoginAt: firebaseUser.metadata.lastSignInTime,
    );
  }
}
