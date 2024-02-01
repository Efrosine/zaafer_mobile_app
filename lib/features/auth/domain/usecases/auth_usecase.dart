import 'package:dartz/dartz.dart';
import 'package:zaafer_mobile_app/core/exception/auth_excepion.dart';
import 'package:zaafer_mobile_app/core/usecase/usercase.dart';
import 'package:zaafer_mobile_app/features/auth/domain/entities/auth_entity.dart';
import 'package:zaafer_mobile_app/features/auth/domain/repositories/auth_repo.dart';

class SignInUseCase
    extends FutureUseCaseParams<Either<SignInException, void>, AuthEntity> {
  SignInUseCase(this._repo);

  final AuthRepo _repo;

  @override
  Future<Either<SignInException, void>> call(AuthEntity? params) {
    return _repo.signIn(params!);
  }
}

class SignUpUseCase
    extends FutureUseCaseParams<Either<SignUpException, void>, AuthEntity> {
  SignUpUseCase(this._repo);

  final AuthRepo _repo;

  @override
  Future<Either<SignUpException, void>> call(AuthEntity? params) {
    return _repo.signUp(params!);
  }
}

class SignOutUseCase implements FutureUseCase<void> {
  SignOutUseCase(this._repo);

  final AuthRepo _repo;

  @override
  Future<void> call([void params]) {
    return _repo.signOut();
  }
}

class IsSignedInUseCase implements UseCase<bool> {
  IsSignedInUseCase(this._repo);

  final AuthRepo _repo;

  @override
  bool call() {
    return _repo.isSignedIn();
  }
}
