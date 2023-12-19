import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/get_data_model.dart';
import 'package:flutter_common_widgets/Data/Services/api_service.dart';

class GetDataProvider with ChangeNotifier {
  APIService apiService = APIService();
  bool isLoading = false;
  List<GetDataModel> getDataList = [];

  Future<void> getData() async {
    try {
      isLoading = true;
      getDataList = await apiService.getData();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
