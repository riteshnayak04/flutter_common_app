import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/phone_model.dart';
import 'package:flutter_common_widgets/Data/Services/phone_service.dart';

class PhoneProvider extends ChangeNotifier {
  PhoneService phoneService = PhoneService();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<void> phoneVerify({
    required PhoneModel phoneModel,
    required Function onSuccess,
    required Function(String) onError,
  }) async {
    isLoading = true;
    notifyListeners();
    final response = await phoneService.phoneNumberVerify(phoneModel);
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
