import 'package:dartz/dartz.dart';
import 'package:zaafer_mobile_app/core/exception/auth_excepion.dart';
import 'package:zaafer_mobile_app/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {
  Future<Either<SignInException, void>> signIn(AuthEntity authEntity);
  Future<Either<SignUpException, void>> signUp(AuthEntity authEntity);
  Future<void> signOut();
  bool isSignedIn();
}
