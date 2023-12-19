import 'package:http/http.dart' as http;

class NetworkHandler {
  static Uri buildUrl(String endpoint) {
    String baseUrl = 'https://reqres.in';
    final apiPath = '$baseUrl$endpoint';
    return Uri.parse(apiPath);
  }

  static final client = http.Client();

  // get api
  static Future<http.Response> getRequest({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    final url = buildUrl(endpoint);
    return await client.get(
      url,
      headers: headers,
    );
  }

  // post api
  static Future<http.Response> postRequest({
    required String endpoint,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = buildUrl(endpoint);
    return await client.post(
      url,
      headers: headers,
      body: body,
    );
  }

  // put api
  static Future<http.Response> putRequest({
    required String endpoint,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = buildUrl(endpoint);
    return await http.put(
      url,
      headers: headers,
      body: body,
    );
  }

  // delete api
  static Future<http.Response> deleteRequest({
    required String endpoint,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = buildUrl(endpoint);
    return await http.delete(
      url,
      headers: headers,
      body: body,
    );
  }

  // multipart api
  static Future multipartRequest({
    required String endpoint,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = buildUrl(endpoint);
    return await http.MultipartRequest(
      'POST',
      url,
    );
  }
}

class Headers {
  static Map<String, String> getHeaders(String? token) {
    return {
      'Content-Type': 'application/json',
      'Authrizaton': 'token $token',
    };
  }

  static Map<String, String> getMultpartHeadrs(String? token) {
    return {
      'Content-Type': 'multipart/form-data',
      'Authrizaton': 'token $token',
    };
  }
}

////////

class NetworkHandler1 {
  static Uri buidlUrl(String endPoint) {
    String baseUrl = 'https://paykl.my/api/v1';
    final apiPath = '$baseUrl$endPoint';
    return Uri.parse(apiPath);
  }

  static Future<http.Response> getRequest({
    required String endPoint,
    required Map<String, String> headers,
  }) async {
    final url = buidlUrl(endPoint);
    final response = await http.get(url, headers: headers);
    return response;
  }

  static Future<http.Response> postRequest({
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = buidlUrl(endPoint);
    final response = await http.post(url, headers: headers, body: body);
    return response;
  }

  static Future<http.Response> putRequest({
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = buidlUrl(endPoint);
    final response = await http.put(url, headers: headers, body: body);
    return response;
  }

  static Future<http.Response> deleteRequest({
    required String endPoint,
    required Map<String, String> headers,
  }) async {
    final url = buidlUrl(endPoint);
    final response = await http.delete(url, headers: headers);
    return response;
  }

  static Future<http.Response> patchRequest({
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = buidlUrl(endPoint);
    final response = await http.patch(url, headers: headers, body: body);
    return response;
  }

  static Future<http.Response> postRequestWithFile({
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = buidlUrl(endPoint);
    final request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    body.forEach((key, value) {
      if (value is String) {
        request.fields[key] = value;
      } else if (value is List<int>) {
        request.files.add(http.MultipartFile.fromBytes(key, value));
      }
    });
    final response = await request.send();
    return http.Response.fromStream(response);
  }

  static Future<http.Response> putRequestWithFile({
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = buidlUrl(endPoint);
    final request = http.MultipartRequest('PUT', url);
    request.headers.addAll(headers);
    body.forEach((key, value) {
      if (value is String) {
        request.fields[key] = value;
      } else if (value is List<int>) {
        request.files.add(http.MultipartFile.fromBytes(key, value));
      }
    });
    final response = await request.send();
    return http.Response.fromStream(response);
  }

  static Future<http.Response> patchRequestWithFile({
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = buidlUrl(endPoint);
    final request = http.MultipartRequest('PATCH', url);
    request.headers.addAll(headers);
    body.forEach((key, value) {
      if (value is String) {
        request.fields[key] = value;
      } else if (value is List<int>) {
        request.files.add(http.MultipartFile.fromBytes(key, value));
      }
    });
    final response = await request.send();
    return http.Response.fromStream(response);
  }

  static Future<http.Response> deleteRequestWithFile({
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final url = buidlUrl(endPoint);
    final request = http.MultipartRequest('DELETE', url);
    request.headers.addAll(headers);
    body.forEach((key, value) {
      if (value is String) {
        request.fields[key] = value;
      } else if (value is List<int>) {
        request.files.add(http.MultipartFile.fromBytes(key, value));
      }
    });
    final response = await request.send();
    return http.Response.fromStream(response);
  }
}
