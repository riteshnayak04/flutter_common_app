import 'package:flutter/material.dart';

class ContrainedBoxWidget extends StatefulWidget {
  const ContrainedBoxWidget({super.key});

  @override
  State<ContrainedBoxWidget> createState() => _ContrainedBoxWidgetState();
}

class _ContrainedBoxWidgetState extends State<ContrainedBoxWidget> {
  String imageurl =
      'https://resize.indiatvnews.com/en/resize/newbucket/1080_-/2023/08/mahesh-babu-9-1691550342.jpg';
  String imageurl2 =
      'https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2016/06/short-1465539582.jpg';
  String imageurl3 =
      'https://images.herzindagi.info/image/2022/May/kurti-styling-tips-for-short-heighted-girl.jpg';
  List<String> imageUrlList = [
    // 'https://resize.indiatvnews.com/en/resize/newbucket/1080_-/2023/08/mahesh-babu-9-1691550342.jpg',
    'https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2016/06/short-1465539582.jpg',
    'https://images.herzindagi.info/image/2022/May/kurti-styling-tips-for-short-heighted-girl.jpg',
    'https://pragativadi.com/wp-content/uploads/2022/06/Untitled-design-105.png',
    // 'https://i.pinimg.com/474x/14/01/b3/1401b31d7550cc98c1dee9046166cde8.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContrainedBox'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 220,
          minWidth: MediaQuery.of(context).size.width * 1.0,
          maxWidth: MediaQuery.of(context).size.width * 1.0,
          maxHeight: 550.0,
        ),
        child: PageView.builder(
          itemCount: imageUrlList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.black87,
                // image: DecorationImage(
                //   fit: BoxFit.fitWidth,
                //   image: NetworkImage(
                //     imageurl3,
                //   ),
                // ),
              ),
              child: Image.network(
                imageUrlList[index],
                fit: BoxFit.fitWidth,
              ),
            );
            // ConstrainedBox(
            //   constraints: BoxConstraints(
            //     minHeight: 220,
            //     minWidth: MediaQuery.of(context).size.width * 1.0,
            //     maxWidth: MediaQuery.of(context).size.width * 1.0,
            //     maxHeight: 500.0,
            //   ),
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       color: Colors.black,
            //       // image: DecorationImage(
            //       //   fit: BoxFit.fitWidth,
            //       //   image: NetworkImage(
            //       //     imageurl3,
            //       //   ),
            //       // ),
            //     ),
            //     child: Image.network(
            //       imageUrlList[index],
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}



// Column(
//             children: [
//               const SizedBox(height: 20.0),
//               // Container(
//               //   decoration: BoxDecoration(
//               //     color: Colors.black,
//               //     image: DecorationImage(
//               //       image: NetworkImage(
//               //         imageurl2,
//               //       ),
//               //     ),
//               //   ),
//               //   constraints: BoxConstraints(
//               //     minHeight: 220,
//               //     minWidth: MediaQuery.of(context).size.width * 1.0,
//               //     maxWidth: MediaQuery.of(context).size.width * 1.0,
//               //     maxHeight: 550.0,
//               //   ),
//               //   // child: const Text(
//               //   //   'data',
//               //   //   style: TextStyle(
//               //   //     color: Colors.white,
//               //   //     fontSize: 30.0,
//               //   //   ),
//               //   // ),
//               // ),
//               ///
//               ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: 220,
//                   // minWidth: MediaQuery.of(context).size.width * 1.0,
//                   maxWidth: MediaQuery.of(context).size.width * 1.0,
//                   maxHeight: 550.0,
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     image: DecorationImage(
//                       image: NetworkImage(
//                         imageurl3,
//                       ),
//                     ),
//                   ),
//                   // child: const Text(
//                   //   'data',
//                   //   style: TextStyle(
//                   //     color: Colors.white,
//                   //     fontSize: 30.0,
//                   //   ),
//                   // ),
//                 ),
//               ),
//             ],
//           ),