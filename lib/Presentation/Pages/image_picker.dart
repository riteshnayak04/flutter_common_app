import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductReview extends StatefulWidget {
  const ProductReview({super.key});

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  final List<XFile> _imageFileList = [];
  XFile? video;
  // VideoPlayerController? _controller;
  bool loading = false;
  // @override
  // void dispose() {
  //   super.dispose();
  //   if (_controller != null) _controller?.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Product Review",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // CustomText(value: "Product Rating", size: 18),
                      SizedBox(height: 10),
                      // Rating(onRatingUpdate: (val) {}),
                      SizedBox(height: 10),
                      // CustomText(value: "Seller Experience", size: 18),
                      SizedBox(height: 10),
                      // Rating(onRatingUpdate: (val) {}),
                      // Divider(),
                      // Align(
                      //     alignment: Alignment.centerLeft,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(15),
                      //       child: CustomText(
                      //           value: "Write product feedback", size: 18),
                      //     )),
                      // SizedBox(height: 10),
                      // Container(
                      //   padding: EdgeInsets.all(8),
                      //   decoration: BoxDecoration(
                      //       color: Colors.grey[200],
                      //       border: Border.all(color: Colors.amber[400]!),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: TextFormField(
                      //     maxLines: 5,
                      //     maxLength: 500,
                      //     decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: "Write product feedback here...",
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 10),
                      // ExpansionTile(
                      //   title: Text('Add Review Images'),
                      //   children: [
                      //     Container(
                      //       padding: EdgeInsets.all(8),
                      //       decoration: BoxDecoration(
                      //           color: Colors.grey[200],
                      //           border: Border.all(color: Colors.amber[400]!),
                      //           borderRadius: BorderRadius.circular(10)),
                      //       child: TextFormField(
                      //         maxLines: 5,
                      //         maxLength: 500,
                      //         decoration: InputDecoration(
                      //           border: InputBorder.none,
                      //           hintText: "Write Seller feedback here...",
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Divider(),
                      // CustomText(value: "Add Review Images", size: 18),
                      Text('Add Review Images', style: TextStyle(fontSize: 18)),
                      Container(
                        height: 150,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.amber[400]!),
                            borderRadius: BorderRadius.circular(10)),
                        child: _imageFileList.isNotEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: _imageFileList.length,
                                          itemBuilder: (context, index) {
                                            return Center(
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  child: Stack(
                                                    children: [
                                                      SizedBox(
                                                        width: 140,
                                                        height: 140,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Builder(
                                                                  builder:
                                                                      (context) {
                                                                    return Image
                                                                        .file(
                                                                      File(_imageFileList[
                                                                              index]
                                                                          .path),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Image.file(
                                                              File(
                                                                  _imageFileList[
                                                                          index]
                                                                      .path),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              _imageFileList
                                                                  .removeAt(
                                                                      index);
                                                              setState(() {});
                                                            },
                                                            icon: const Icon(
                                                              Icons.cancel,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      )
                                                    ],
                                                  )),
                                            );
                                          }),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        border: Border.all(
                                            color: Colors.amber[400]!),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                      onPressed: () async {
                                        final ImagePicker _picker =
                                            ImagePicker();
                                        final XFile? image =
                                            await _picker.pickImage(
                                                imageQuality: 50,
                                                source: ImageSource.gallery);
                                        if (image != null) {
                                          _imageFileList.add(image);
                                        }
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    onPressed: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      final XFile? image =
                                          await _picker.pickImage(
                                              imageQuality: 50,
                                              source: ImageSource.camera);
                                      if (image != null) {
                                        _imageFileList.add(image);
                                      }
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.add_a_photo,
                                      size: 20,
                                    )),
                              ),
                      ),
                      const SizedBox(height: 10),

                      // CustomText(value: "Add Review Video", size: 18),

                      // Container(
                      //   height: 150,
                      //   decoration: BoxDecoration(
                      //       color: Colors.grey[200],
                      //       border: Border.all(color: Colors.amber[400]!),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   padding: EdgeInsets.all(8),
                      //   child: _controller != null
                      //       ? Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Stack(
                      //               children: [
                      //                 SizedBox(
                      //                   width: 140,
                      //                   child: ClipRRect(
                      //                     borderRadius:
                      //                         BorderRadius.circular(10),
                      //                     child: VideoPlayer(_controller!),
                      //                   ),
                      //                 ),
                      //                 Positioned(
                      //                   top: 0,
                      //                   right: 0,
                      //                   bottom: 0,
                      //                   left: 0,
                      //                   child: IconButton(
                      //                       onPressed: () {
                      //                         Navigator.push(
                      //                             context,
                      //                             MaterialPageRoute(
                      //                                 builder: (context) =>
                      //                                     Builder(builder:
                      //                                         (context) {
                      //                                       _controller!.play();
                      //                                       return VideoPlayer(
                      //                                           _controller!);
                      //                                     })));
                      //                       },
                      //                       icon: Icon(
                      //                         Icons.play_arrow,
                      //                         color: Colors.white,
                      //                       )),
                      //                 )
                      //               ],
                      //             ),
                      //             SizedBox(width: 10),
                      //             Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.amber,
                      //                     borderRadius:
                      //                         BorderRadius.circular(10)),
                      //                 child: IconButton(
                      //                     onPressed: () {
                      //                       _controller!.dispose();
                      //                       _controller = null;
                      //                       video = null;
                      //                       setState(() {});
                      //                     },
                      //                     icon: Icon(
                      //                       Icons.delete,
                      //                       color: Colors.white,
                      //                     )))
                      //           ],
                      //         )
                      //       : Center(
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //                 color: Colors.grey[200],
                      //                 borderRadius: BorderRadius.circular(10)),
                      //             child: IconButton(
                      //                 onPressed: () async {
                      //                   await Permission.storage.request();
                      //                   await Permission.manageExternalStorage
                      //                       .request();

                      //                   final ImagePicker _picker =
                      //                       ImagePicker();
                      //                   XFile? video = await _picker.pickVideo(
                      //                     source: ImageSource.camera,
                      //                     maxDuration: Duration(seconds: 30),
                      //                   );

                      //                   if (video != null) {
                      //                     setState(() {
                      //                       loading = true;
                      //                     });

                      //                     // final info =
                      //                     //     await VideoCompress.compressVideo(
                      //                     //   video.path,
                      //                     //   quality: VideoQuality.MediumQuality,
                      //                     //   deleteOrigin: true,
                      //                     //   includeAudio: true,
                      //                     // );
                      //                     // video = XFile(info!.path!);
                      //                     try {
                      //                       final info = await VideoCompress
                      //                           .compressVideo(
                      //                         video.path,
                      //                         quality:
                      //                             VideoQuality.MediumQuality,
                      //                         includeAudio: true,
                      //                       );
                      //                       if (info != null) {
                      //                         video = XFile(info.path!);
                      //                       }
                      //                     } catch (e) {
                      //                       print("Error: $e");
                      //                       VideoCompress.cancelCompression();
                      //                       ScaffoldMessenger.of(context)
                      //                           .showSnackBar(
                      //                         SnackBar(
                      //                           backgroundColor:
                      //                               Colors.redAccent,
                      //                           duration: Duration(
                      //                             seconds: 5,
                      //                           ),
                      //                           content: Container(
                      //                             child: Row(
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment
                      //                                       .center,
                      //                               children: [
                      //                                 Icon(
                      //                                   Icons.warning,
                      //                                   color: Colors.white,
                      //                                 ),
                      //                                 Text(
                      //                                   'Something went wrong,\nTry again Later',
                      //                                   textAlign:
                      //                                       TextAlign.center,
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       );
                      //                     }

                      //                     _controller =
                      //                         VideoPlayerController.file(
                      //                             File(video!.path));
                      //                     _controller!.initialize();
                      //                     setState(() {
                      //                       loading = false;
                      //                     });
                      //                   }
                      //                 },
                      //                 icon: Icon(
                      //                   Icons.video_camera_back,
                      //                   size: 20,
                      //                 )),
                      //           ),
                      //         ),
                      // ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Text("Submit"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (loading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
