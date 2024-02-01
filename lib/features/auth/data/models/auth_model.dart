import 'package:zaafer_mobile_app/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    email,
    password,
  }) : super(email: email, password: password);

  factory AuthModel.fromEntity(AuthEntity entity) {
    return AuthModel(
      email: entity.email,
      password: entity.password,
    );
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
