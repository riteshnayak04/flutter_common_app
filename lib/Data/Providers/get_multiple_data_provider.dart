import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/get_multiple_data_model.dart';
import 'package:flutter_common_widgets/Data/Services/get_multiple_data_service.dart';

class GetMultipleDataProvider with ChangeNotifier {
  GetMultipleDataService getMultipleDataService = GetMultipleDataService();
  List<GetMultipleDataModel> getMultipleDataModelList = [];
  bool isLoading = false;

  Future<void> getMultipleData() async {
    isLoading = true;
    try {
      getMultipleDataModelList = await getMultipleDataService.getMultipleData();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      throw Exception(e);
    }
  }
}
