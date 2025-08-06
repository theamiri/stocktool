import '../../../../core/error/either.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class SendPasswordResetParams {
  final String email;

  const SendPasswordResetParams({required this.email});
}

class SendPasswordResetUseCase
    implements UseCase<void, SendPasswordResetParams> {
  final AuthRepository repository;

  SendPasswordResetUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SendPasswordResetParams params) async {
    return await repository.sendPasswordResetEmail(params.email);
  }
}
