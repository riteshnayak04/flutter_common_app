class GetDataModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  GetDataModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory GetDataModel.fromJson(Map<String, dynamic> json) {
    print("#### 1. json: $json");
    return GetDataModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}
