import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/get_poll_api_model.dart';
import 'package:flutter_common_widgets/Data/Services/get_poll_api_service.dart';

class GetPollApiProvider with ChangeNotifier {
  GetPollApiService getPollApiService = GetPollApiService();
  List<GetPollApiModel> getPollApiModelList = [];
  bool isLoading = false;

  Future<void> getPollApiData() async {
    isLoading = true;
    getPollApiModelList = await getPollApiService.getPollApiData();
    isLoading = false;
    notifyListeners();
  }
}
