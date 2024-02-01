import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaafer_mobile_app/config/extentions/string_validator.dart';
import 'package:zaafer_mobile_app/features/auth/domain/entities/auth_entity.dart';
import 'package:zaafer_mobile_app/features/auth/presentation/bloc/form_item.dart';

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
    var email = state.email!.value;
    var password = state.password!.value;

    emit(AuthLoadingState());

    final result = await _singInUseCase(AuthEntity(email: email, password: password));

    result.fold(
      (l) => emit(AuthErrorState(l.code)),
      (r) => emit(AuthSuccessState()),
    );
  }

  FutureOr<void> _authSignUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    final email = state.email!.value;
    final password = state.password!.value;

    emit(AuthLoadingState());

    final result = await _singUpUseCase(AuthEntity(email: email, password: password));

    result.fold(
      (l) => emit(AuthErrorState(l.code)),
      (r) => emit(AuthSuccessState()),
    );
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
    } else {
      emit(AuthInitState());
    }
  }

  FutureOr<void> _authEmailChanged(AuthEmailChangedEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        email: FormItem(
          value: event.email,
          error: event.email.isValidEmail() ? null : 'Invalid email',
        ),
      ),
    );
  }

  FutureOr<void> _authPasswordChanged(
      AuthPasswordChangedEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        password: FormItem(
          value: event.password,
          error: event.password.isValidPassword() ? null : 'Invalid password',
        ),
      ),
    );
  }

  FutureOr<void> _authConfirmPasswordChanged(
      AuthConfirmPasswordChangedEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        confirmPassword: FormItem(
          value: event.confirmPassword,
          error: event.confirmPassword.isValidConfirmPassword(state.password?.value ?? '')
              ? null
              : 'Password not match',
        ),
      ),
    );
  }
}
