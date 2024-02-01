import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zaafer_mobile_app/core/exception/auth_excepion.dart';
import 'package:zaafer_mobile_app/features/auth/data/datasources/firebase/auth_service.dart';
import 'package:zaafer_mobile_app/features/auth/data/models/auth_model.dart';
import 'package:zaafer_mobile_app/features/auth/domain/entities/auth_entity.dart';
import 'package:zaafer_mobile_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this._service);

  final AuthService _service;

  @override
  bool isSignedIn() {
    return _service.isSignedIn();
  }

  @override
  Future<Either<SignInException, void>> signIn(AuthEntity authEntity) async {
    try {
      await _service.signIn(AuthModel.fromEntity(authEntity));
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(SignInException.fromCode(e.code));
    } catch (e) {
      return Left(SignInException());
    }
  }

  @override
  Future<void> signOut() {
    return _service.signOut();
  }

  @override
  Future<Either<SignUpException, void>> signUp(AuthEntity authEntity) async {
    try {
      await _service.signUp(AuthModel.fromEntity(authEntity));
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(SignUpException.fromCode(e.code));
    } catch (e) {
      return Left(SignUpException());
    }
  }
}
