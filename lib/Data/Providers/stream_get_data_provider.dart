import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/get_data_model.dart';
import 'package:flutter_common_widgets/Data/Services/api_service.dart';

class StremGetDataProvider extends ChangeNotifier {
  APIService apiService = APIService();

  final StreamController<List<GetDataModel>> streamController =
      StreamController();
  List<GetDataModel> getDataList = [];
  bool isLoading = false;
  Future<void> getStremData() async {
    isLoading = true;
    notifyListeners();
    try {
      getDataList = await apiService.getData();
      isLoading = false;
      notifyListeners();
      streamController.sink.add(getDataList);
      // print('')
      print('getDataList: $getDataList');
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
