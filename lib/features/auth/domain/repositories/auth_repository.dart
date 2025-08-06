import '../../../../core/error/either.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Stream<Either<Failure, User?>> get authStateChanges;
  Future<Either<Failure, User?>> get currentUser;

  Future<Either<Failure, User>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, User>> createUserWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
  );
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> sendPasswordResetEmail(String email);
  Future<Either<Failure, void>> updateUserProfile({
    String? firstName,
    String? lastName,
    String? displayName,
  });
}
