// {
//     "device_id":"21456789",
//     "device_type":"android",
//     "device_token":"sdfsdf",
//     "mobile":"7989701694",
//     "admin_id": "2"
// }

class PhoneModel {
  String deviceId;
  String deviceType;
  String deviceToken;
  String mobile;
  String adminId;

  PhoneModel({
    required this.deviceId,
    required this.deviceType,
    required this.deviceToken,
    required this.mobile,
    required this.adminId,
  });

  // factory PhoneModel.fromJson(Map<String, dynamic> json) {
  //   return PhoneModel(
  //     deviceId: json['device_id'],
  //     deviceType: json['device_type'],
  //     deviceToken: json['device_token'],
  //     mobile: json['mobile'],
  //     adminId: json['admin_id'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      "device_id": deviceId,
      "device_type": deviceType,
      "device_token": deviceToken,
      "mobile": mobile,
      "admin_id": adminId,
    };
  }
}
