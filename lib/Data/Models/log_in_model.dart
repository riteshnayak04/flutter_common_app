class LogInModel {
  String? email;
  String? password;

  LogInModel({
    this.email,
    this.password,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    print('#### 1. email: $email, password: $password');
    return {
      'email': email,
      'password': password,
    };
  }
}
