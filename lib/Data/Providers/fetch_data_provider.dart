import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/fetch_data_model.dart';
import 'package:flutter_common_widgets/Data/Services/fetch_data_servic.dart';

class FetchDataProvider with ChangeNotifier {
  FetchDataService fetchDataService = FetchDataService();
  bool isLoading = false;
  List<FetchDataModel> fetchDataList = [];

  Future<void> fetchData() async {
    isLoading = true;
    try {
      fetchDataList = await fetchDataService.fetchData();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('##### 4. Error: $e');
    }
  }
}
