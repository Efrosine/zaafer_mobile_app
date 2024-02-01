import 'dart:async';

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaafer_mobile_app/config/extentions/string_validator.dart';
import 'package:zaafer_mobile_app/features/auth/domain/entities/auth_entity.dart';

import '../../domain/usecases/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._singInUseCase,
    this._singUpUseCase,
    this._logOutUseCase,
    this._isSignedInUseCase,
  ) : super(AuthInitState()) {
    on<AuthChangeMethodEvent>(_authChangeMethod);
    on<AuthSignInEvent>(_authSignIn);
    on<AuthSignUpEvent>(_authSignUp);
    on<AuthSignOutEvent>(_authSignOut);
    on<AuthCheckEvent>(_authCheck);
    on<AuthEmailChangedEvent>(_authEmailChanged);
    on<AuthPasswordChangedEvent>(_authPasswordChanged);
    on<AuthConfirmPasswordChangedEvent>(_authConfirmPasswordChanged);
  }

  final IsSignedInUseCase _isSignedInUseCase;
  final SignOutUseCase _logOutUseCase;
  final SignInUseCase _singInUseCase;
  final SignUpUseCase _singUpUseCase;

  FutureOr<void> _authChangeMethod(AuthChangeMethodEvent event, Emitter<AuthState> emit) {
    emit(AuthChangeMethodState());
    emit(AuthInitState());
  }

  FutureOr<void> _authSignIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    await _singInUseCase(event.authEntity).then((value) {
      value.fold(
        (l) => emit(AuthErrorState(l.code)),
        (r) => emit(AuthSuccessState()),
      );
    });
  }

  FutureOr<void> _authSignUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await _singUpUseCase(event.authEntity).then((value) {
      value.fold(
        (l) => emit(AuthErrorState(l.code)),
        (r) => emit(AuthSuccessState()),
      );
    });
  }

  FutureOr<void> _authSignOut(AuthSignOutEvent event, Emitter<AuthState> emit) {
    emit(AuthLoadingState());
    _logOutUseCase().then((value) {
      emit(AuthSuccessState());
    });
  }

  FutureOr<void> _authCheck(AuthCheckEvent event, Emitter<AuthState> emit) {
    emit(AuthLoadingState());

    if (_isSignedInUseCase()) {
      emit(AuthSuccessState());
    }
  }

  FutureOr<void> _authEmailChanged(AuthEmailChangedEvent event, Emitter<AuthState> emit) {
    String email = event.email;

    if (email.isValidEmail()) {
      emit(AuthEmailChangedState(email: email));
    } else {
      emit(AuthEmailChangedState(email: email, message: 'Invalid email'));
    }
  }

  FutureOr<void> _authPasswordChanged(
      AuthPasswordChangedEvent event, Emitter<AuthState> emit) {
    String password = event.password;

    if (password.isValidPassword()) {
      emit(AuthPasswordChangedState(password: password));
    } else {
      emit(AuthPasswordChangedState(password: password, message: 'Invalid password'));
    }
  }

  FutureOr<void> _authConfirmPasswordChanged(
      AuthConfirmPasswordChangedEvent event, Emitter<AuthState> emit) {
    String confirmPassword = event.confirmPassword;
    if (confirmPassword.isValidConfirmPassword(event.password)) {
      emit(AuthConfirmPasswordChangedState(confirmPassword: confirmPassword));
    } else {
      emit(AuthConfirmPasswordChangedState(
          confirmPassword: confirmPassword, message: 'Password not match'));
    }
  }
}
