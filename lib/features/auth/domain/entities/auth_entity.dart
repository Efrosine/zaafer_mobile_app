import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  const AuthEntity({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
