import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User> call(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    return await repository.createUserWithEmailAndPassword(
      email,
      password,
      firstName,
      lastName,
    );
  }
}
