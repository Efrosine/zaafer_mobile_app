part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.email = const FormItem(error: 'Please enter your email'),
    this.password = const FormItem(error: 'Please enter your password'),
    this.confirmPassword = const FormItem(error: 'Please enter your confirm password'),
  });

  final FormItem? confirmPassword;
  final FormItem? email;
  final FormItem? password;

  @override
  List<Object> get props => [email!.value, password!.value, confirmPassword!.value];

  AuthState copyWith({
    FormItem? email,
    FormItem? password,
    FormItem? confirmPassword,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}

class AuthInitState extends AuthState {}

class AuthChangeMethodState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  const AuthErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class AuthLoadingState extends AuthState {}
