part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({this.email, this.confirmPassword, this.password});

  final String? confirmPassword;
  final String? email;
  final String? password;

  @override
  List<Object> get props => [email ?? '', password ?? '', confirmPassword ?? ''];
}

class AuthInitState extends AuthState {}

class AuthChangeMethodState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  const AuthErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class AuthLoadingState extends AuthState {}

class AuthEmailChangedState extends AuthState {
  const AuthEmailChangedState({
    super.email,
    this.message,
  });

  final String? message;

  @override
  List<Object> get props => [message ?? ''];
}

class AuthPasswordChangedState extends AuthState {
  const AuthPasswordChangedState({
    super.password,
    this.message,
  });

  final String? message;

  @override
  List<Object> get props => [message ?? ''];
}

class AuthConfirmPasswordChangedState extends AuthState {
  const AuthConfirmPasswordChangedState({
    super.confirmPassword,
    this.message,
  });

  final String? message;

  @override
  List<Object> get props => [message ?? ''];
}
