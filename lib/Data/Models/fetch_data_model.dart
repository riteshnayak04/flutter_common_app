// {
//         "id": 1,
//         "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
//         "price": 109.95,
//         "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
//         "category": "men's clothing",
//         "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
//         "rating": {
//             "rate": 3.9,
//             "count": 120
//         }
//     },

// class FetchDataModel {
//   int id;
//   String title;
//   double price;
//   String description;
//   String category;
//   String image;
//   Rating rating;

//   FetchDataModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.image,
//     required this.rating,
//   });

//   factory FetchDataModel.fromJson(Map<String, dynamic> json) {
//     print('##### 1. FetchDataModel: $json');
//     return FetchDataModel(
//       id: json['id'],
//       title: json['title'],
//       price: json['price'],
//       description: json['description'],
//       category: json['category'],
//       image: json['image'],
//       rating: Rating.fromJson(json['rating']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'price': price,
//       'description': description,
//       'category': category,
//       'image': image,
//       'rating': rating.toJson(),
//     };
//   }
// }

// class Rating {
//   double rate;
//   int count;

//   Rating({
//     required this.rate,
//     required this.count,
//   });

//   factory Rating.fromJson(Map<String, dynamic> json) {
//     return Rating(
//       rate: json['rate'],
//       count: json['count'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'rate': rate,
//       'count': count,
//     };
//   }
// }

//  {
//         "userId": 1,
//         "id": 1,
//         "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//         "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//     },

class FetchDataModel {
  int userId;
  int id;
  String title;
  String body;

  FetchDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory FetchDataModel.fromJson(Map<String, dynamic> json) {
    return FetchDataModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
