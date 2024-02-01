import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.name,
    required this.username,
    required this.phoneNumber,
    required this.gender,
    required this.birthday,
  });

  final String? birthday;
  final String? gender;
  final String? name;
  final String? phoneNumber;
  final String? username;

  factory UserEntity.empty() {
    return const UserEntity(
      name: null,
      username: null,
      phoneNumber: null,
      gender: null,
      birthday: null,
    );
  }
  List<String?> toList() {
    return [name, username, phoneNumber, gender, birthday];
  }

  factory UserEntity.fromList(List<String?> data) {
    return UserEntity(
      name: data[0],
      username: data[1],
      phoneNumber: data[2],
      gender: data[3],
      birthday: data[4],
    );
  }

  @override
  List<Object?> get props => [
        name,
        username,
        phoneNumber,
        gender,
        birthday,
      ];
}
