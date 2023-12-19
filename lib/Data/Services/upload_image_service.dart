import 'package:flutter_common_widgets/Data/Models/upload_model.dart';
import 'package:http/http.dart' as http;

class UploadImageService {
  Future<bool> uploadImageData(
    UploadImageModel uploadImageModel,
  ) async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final request = http.MultipartRequest('POST', url);
    request.fields.addAll({
      'title': uploadImageModel.title,
      'price': uploadImageModel.price,
    });
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        uploadImageModel.image,
      ),
    );
    request.headers.addAll(
      {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer token',
      },
    );

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      print('##### 2. Response String: $responseString');
      print('##### 3. Uploaded!');
      return true;
    } else {
      print(' ##### 4.Failed!');
      return false;
    }
  }
}
