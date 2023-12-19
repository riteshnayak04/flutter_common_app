import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/otp_model.dart';
import 'package:flutter_common_widgets/Data/Services/phone_service.dart';

class OtpProvider with ChangeNotifier {
  OTPService otpService = OTPService();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> otpVerify({
    required OTPModel otpModel,
    required Function onSuccess,
    required Function(String) onError,
  }) async {
    isLoading = true;
    notifyListeners();
    final response = await otpService.otpVerify(otpModel);
    isLoading = false;
    notifyListeners();
    if (response == true) {
      print('#### response: $response');
      onSuccess();
    } else {
      onError('Failed to load data');
    }
  }
}
