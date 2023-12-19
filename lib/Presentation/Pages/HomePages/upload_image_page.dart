import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/upload_model.dart';
import 'package:flutter_common_widgets/Data/Providers/upload_image_provider.dart';
import 'package:provider/provider.dart';

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({super.key});

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Consumer<UploadImageProvider>(builder: (context, value, child) {
        return ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // Image
                (value.image != null)
                    ? Image.file(
                        filterQuality: FilterQuality.high,
                        height: 150,
                        width: 150,
                        File(value.image!.path),
                      )
                    : const CircleAvatar(
                        radius: 60,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                const SizedBox(height: 10),
                // Upload Image Button
                ElevatedButton(
                  onPressed: () {
                    value.getImage();
                  },
                  child: const Text('Upload Image'),
                ),
                // textfield
                const SizedBox(height: 20),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter title',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter price',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(400, 50),
                        ),
                        onPressed: () {
                          UploadImageModel uploadImageModel = UploadImageModel(
                            title: value.titleController.text,
                            price: value.priceController.text,
                            image: value.image!.path,
                          );
                          value.uploadImageData(
                            uploadImageModel: uploadImageModel,
                            onUploadSuccess: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Upload Success!'),
                                ),
                              );
                              print('Upload Success!');
                            },
                            onUploadFailed: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(error),
                                ),
                              );
                              print(error);
                            },
                          );
                        },
                        child: value.isLoading
                            ? const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.deepOrange,
                                ),
                              )
                            : const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
