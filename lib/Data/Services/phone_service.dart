import 'dart:convert';

import 'package:flutter_common_widgets/Data/Models/otp_model.dart';
import 'package:flutter_common_widgets/Data/Models/phone_model.dart';
import 'package:http/http.dart' as http;

class PhoneService {
  Future<bool> phoneNumberVerify(
    PhoneModel phoneModel,
  ) async {
    final response = await http.post(
      Uri.parse('https://www.ondeindia.com/api/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(phoneModel.toJson()),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('#### data: $data');
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

// otp service class
class OTPService {
  Future<bool> otpVerify(
    OTPModel otpModel,
  ) async {
    final response = await http.post(
      Uri.parse('https://www.ondeindia.com/api/user/verify_otp'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(otpModel.toJson()),
    );
    print('#### 1. otp data: ${otpModel.toJson()}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('#### 1. otp data: $data');
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
