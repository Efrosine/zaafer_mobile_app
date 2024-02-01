part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEvent extends AuthEvent {}

class AuthChangeMethodEvent extends AuthEvent {}

class AuthSignInEvent extends AuthEvent {}

class AuthSignUpEvent extends AuthEvent {}

class AuthSignOutEvent extends AuthEvent {}

class AuthEmailChangedEvent extends AuthEvent {
  const AuthEmailChangedEvent({required this.email});

  final String email;
}

class AuthPasswordChangedEvent extends AuthEvent {
  const AuthPasswordChangedEvent({required this.password});

  final String password;
}

class AuthConfirmPasswordChangedEvent extends AuthEvent {
  const AuthConfirmPasswordChangedEvent({required this.confirmPassword});

  final String confirmPassword;
}
