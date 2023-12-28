import 'dart:convert';

import 'package:flutter_common_widgets/Data/Models/get_poll_api_model.dart';
import 'package:http/http.dart' as http;

class GetPollApiService {
  Future<List<GetPollApiModel>> getPollApiData() async {
    const url = 'http://daduservices.onlinedemo.co.in/v1/admin/getpolls';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final data = decodeResponse['response'] as List<dynamic>;
      return data.map((e) => GetPollApiModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
