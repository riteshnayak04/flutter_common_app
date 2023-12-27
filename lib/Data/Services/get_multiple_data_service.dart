import 'dart:convert';

import 'package:flutter_common_widgets/Data/Models/get_multiple_data_model.dart';
import 'package:http/http.dart' as http;

class GetMultipleDataService {
  Future<List<GetMultipleDataModel>> getMultipleData() async {
    try {
      const url = 'https://reqres.in/api/users?page';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodeResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        final data = decodeResponse['data'] as List<dynamic>;
        return data.map((e) => GetMultipleDataModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
