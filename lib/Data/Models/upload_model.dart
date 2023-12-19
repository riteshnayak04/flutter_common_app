class UploadImageModel {
  String title;
  String price;
  String image;

  UploadImageModel({
    required this.title,
    required this.price,
    required this.image,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    print('##### 2. fromJson() called!');
    return UploadImageModel(
      title: json['title'],
      price: json['price'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    print('##### 1. toJson() called!');
    return {
      'title': title,
      'price': price,
      'image': image,
    };
  }
}
