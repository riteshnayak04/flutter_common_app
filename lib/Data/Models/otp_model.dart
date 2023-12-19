// {
//     "userId":"1917",
//     "otp":"4002",
//     "admin_id": "2"
// }

class OTPModel {
  String userId;
  String otp;
  String adminId;

  OTPModel({
    required this.userId,
    required this.otp,
    required this.adminId,
  });

  factory OTPModel.fromJson(Map<String, dynamic> json) {
    return OTPModel(
      userId: json['userId'],
      otp: json['otp'],
      adminId: json['admin_id'],
    );
  }

  Map<String, dynamic> toJson() {
    print('#### userId: $userId');
    return {
      "userId": userId,
      "otp": otp,
      "admin_id": adminId,
    };
  }
}
