import 'dart:convert';

import 'package:flutter_common_widgets/Data/Models/get_single_data_model.dart';
import 'package:http/http.dart' as http;

class GetSingleDataService {
  Future<GetSingleDataModel> getSingleData() async {
    const url = 'https://reqres.in/api/users/2';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final data = decodeResponse['data'] as Map<String, dynamic>;
      return GetSingleDataModel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
