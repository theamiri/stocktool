import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../shared/utils/error_handler.dart';

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
  Stream<User?> get authStateChanges {
    try {
      print('🔥 Setting up Firebase auth state stream...');
      return _auth
          .authStateChanges()
          .map((firebaseUser) {
            print('📡 Firebase user changed: ${firebaseUser?.email ?? 'null'}');
            return firebaseUser != null
                ? _mapFirebaseUserToUser(firebaseUser)
                : null;
          })
          .handleError((error) {
            print('Firebase Auth state change error: $error');
            return null;
          });
    } catch (e) {
      print('Error getting auth state changes: $e');
      return Stream.value(null);
    }
  }

  @override
  User? get currentUser {
    try {
      final firebaseUser = _auth.currentUser;
      return firebaseUser != null ? _mapFirebaseUserToUser(firebaseUser) : null;
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw Exception('Sign in failed');
      }

      return _mapFirebaseUserToUser(credential.user!);
    } catch (e) {
      ErrorHandler.logError(e, null, 'signInWithEmailAndPassword');
      throw Exception(ErrorHandler.getDisplayError(e));
    }
  }

  @override
  Future<User> createUserWithEmailAndPassword(
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
        throw Exception('User creation failed');
      }

      // Update display name
      await credential.user!.updateDisplayName('$firstName $lastName');

      return _mapFirebaseUserToUser(credential.user!);
    } catch (e) {
      ErrorHandler.logError(e, null, 'createUserWithEmailAndPassword');
      throw Exception(ErrorHandler.getDisplayError(e));
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Sign out error: $e');
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
    );
  }
}
