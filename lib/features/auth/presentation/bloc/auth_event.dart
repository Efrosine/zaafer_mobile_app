part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthChangeMethodEvent extends AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  const AuthSignInEvent({required this.authEntity});

  final AuthEntity authEntity;
}

class AuthSignUpEvent extends AuthEvent {
  const AuthSignUpEvent({required this.authEntity});

  final AuthEntity authEntity;
}

class AuthSignOutEvent extends AuthEvent {}

class AuthCheckEvent extends AuthEvent {}

class AuthEmailChangedEvent extends AuthEvent {
  const AuthEmailChangedEvent({required this.email});

  final String email;
}

class AuthPasswordChangedEvent extends AuthEvent {
  const AuthPasswordChangedEvent({required this.password});

  final String password;
}

class AuthConfirmPasswordChangedEvent extends AuthEvent {
  const AuthConfirmPasswordChangedEvent({required this.password, required this.confirmPassword});

  final String password;
  final String confirmPassword;
}
