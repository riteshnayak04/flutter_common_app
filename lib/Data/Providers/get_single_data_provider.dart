import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/get_single_data_model.dart';
import 'package:flutter_common_widgets/Data/Services/get_single_data_service.dart';

class GetSingleDataProvider with ChangeNotifier {
  GetSingleDataService getSingleDataService = GetSingleDataService();
  bool isLoading = false;
  GetSingleDataModel? getSingleDataModel;

  Future<void> getSingleData() async {
    isLoading = true;
    notifyListeners();
    try {
      getSingleDataModel = await getSingleDataService.getSingleData();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
