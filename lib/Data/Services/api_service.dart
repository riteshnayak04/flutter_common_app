import 'dart:convert';
import 'package:flutter_common_widgets/Data/Models/get_data_model.dart';
import 'package:flutter_common_widgets/Data/Models/log_in_model.dart';
import 'package:flutter_common_widgets/Data/Services/NetworkHandler/network_handler.dart';

class APIService {
  Future<List<GetDataModel>> getData() async {
    try {
      final response = await NetworkHandler.getRequest(
        endpoint: '/api/users?page=2',
        headers: Headers.getHeaders('token'),
      );
      if (response.statusCode == 200) {
        final decodeResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        final data = decodeResponse['data'] as List<dynamic>;
        print('#### 2. data: $data');
        return data.map((e) => GetDataModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('#### 3. error: $e');
      throw Exception('Failed to load data');
    }
  }

  Future<GetDataModel> getSingleData() async {
    try {
      final response = await NetworkHandler.getRequest(
        endpoint: '/api/users/2',
        headers: Headers.getHeaders('token'),
      );
      if (response.statusCode == 200) {
        final decodeResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        print('#### 2. data: $decodeResponse');
        return GetDataModel.fromJson(decodeResponse);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('#### 3. error: $e');
      throw Exception('Failed to load data');
    }
  }

  Future<bool> postData(LogInModel logInModel) async {
    try {
      final response = await NetworkHandler.postRequest(
        endpoint: '/api/login',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(logInModel.toJson()),
      );
      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        print('#### 2. data: $decodeResponse');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('#### 3. error: $e');
      return false;
    }
  }

  Future<bool> putData(LogInModel logInModel) async {
    final response = await NetworkHandler.putRequest(
      endpoint: '/api/users/2',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(logInModel.toJson()),
    );
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      print('#### 2. data: $decodeResponse');
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteData(int id) async {
    final response = await NetworkHandler.deleteRequest(
      endpoint: '/api/users/2',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id}),
    );
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      print('#### 2. data: $decodeResponse');
      return true;
    } else {
      return false;
    }
  }

  Future<bool> multipartData() async {
    final response = await NetworkHandler.multipartRequest(
      endpoint: '/api/users/2',
      headers: Headers.getMultpartHeadrs('token'),
      body: jsonEncode({'id': 2}),
    );
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      print('#### 2. data: $decodeResponse');
      return true;
    } else {
      return false;
    }
  }
}

class PostAPIService {
  Future<LogInModel> postData(LogInModel logInModel) async {
    try {
      final response = await NetworkHandler.postRequest(
        endpoint: '/api/login',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(logInModel.toJson()),
      );
      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        print('@@@@ 2. data: $decodeResponse');
        return LogInModel.fromJson(decodeResponse);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('@@@ 3. error: $e');
      throw Exception('Failed to load data');
    }
  }
}
