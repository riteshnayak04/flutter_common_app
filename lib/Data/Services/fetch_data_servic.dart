import 'dart:convert';
import 'package:flutter_common_widgets/Data/Models/fetch_data_model.dart';
import 'package:http/http.dart' as http;

class FetchDataService {
  Future<List<FetchDataModel>> fetchData() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body) as List;
      final result =
          decodedResponse.map((e) => FetchDataModel.fromJson(e)).toList();
      print('##### 2. FetchDataService: $result');
      return result;
    } else {
      print('##### 3. Error: ${response.statusCode}');
      throw Exception('Failed to load data!');
    }
  }
}
