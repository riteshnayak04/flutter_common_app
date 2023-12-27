import 'dart:math';

class GetSingleDataModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  GetSingleDataModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory GetSingleDataModel.fromJson(Map<String, dynamic> json) {
    return GetSingleDataModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
