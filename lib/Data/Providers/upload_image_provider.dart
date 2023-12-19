import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/upload_model.dart';
import 'package:flutter_common_widgets/Data/Services/upload_image_service.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageProvider extends ChangeNotifier {
  UploadImageService uploadImageService = UploadImageService();
  XFile? image;
  ImagePicker picker = ImagePicker();
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> getImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      notifyListeners();
    } else {
      print('No image selected.');
    }
    notifyListeners();
  }

  Future<void> uploadImageData({
    required UploadImageModel uploadImageModel,
    required Function onUploadSuccess,
    required Function(String) onUploadFailed,
  }) async {
    isLoading = true;
    final result = await uploadImageService.uploadImageData(uploadImageModel);
    isLoading = false;
    if (result) {
      onUploadSuccess();
    } else {
      onUploadFailed('Upload Failed!');
    }
  }
}
