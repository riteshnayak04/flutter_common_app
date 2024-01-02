import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/search_api_model.dart';
import 'package:http/http.dart' as http;

// class SearchApiService {
//   Future<List<String>> searchData(String query) async {
//     const url = 'https://reqres.in/api/users?page';
//     final response = await http.get(Uri.parse(url));
//     if(response.statusCode == 200){
//       final decodeResponse = jsonDecode(response.body) as Map<String, dynamic>;
//       final List<dynamic> data = decodeResponse['data'];
//       return data.map((e) => e['first_name'] as String).toList();
//     }
//   }
// }

class SearchProvider extends ChangeNotifier {
  List<SearchApiModel> _searchResults = [];

  List<SearchApiModel> get searchResults => _searchResults;

  Future<void> search(String query) async {
    final response = await http.get(Uri.parse('YOUR_API_ENDPOINT?q=$query'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      _searchResults =
          data.map((json) => SearchApiModel.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
