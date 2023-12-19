// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/log_in_model.dart';
import 'package:flutter_common_widgets/Data/Services/api_service.dart';
import 'package:flutter_common_widgets/Presentation/Utils/loading_dialog.dart';

class LogInProvider with ChangeNotifier {
  APIService apiService = APIService();
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> logIn({
    required BuildContext context,
    required LogInModel logInModel,
    required Function onSuccess,
    required Function(String) onError,
  }) async {
    // isLoading = true;
    LoadingDialog.showLoadingDialog(context, 'Loading...');
    notifyListeners();
    final response = await apiService.postData(logInModel);
    // isLoading = false;
    LoadingDialog.hideLoadingDialog(context);
    notifyListeners();
    if (response == true) {
      onSuccess();
    } else {
      onError('Log In failed, email or password is incorrect');
    }
  }
}

// class PostApiProvider with ChangeNotifier {
//   PostAPIService apiService = PostAPIService();

//   Future<void> postData({
//     required BuildContext context,
//     required LogInModel logInModel,
//     required Function onSuccess,
//     required Function(String) onError,
//   }) async {
//     LoadingDialog.showLoadingDialog(context, 'Posting...');
//     notifyListeners();
//     final response = await apiService.postData(logInModel);
//     LoadingDialog.hideLoadingDialog(context);
//     notifyListeners();
//     if (response == true) {
//       onSuccess();
//     } else {
//       onError('Posting failed');
//     }
//   }
// }
