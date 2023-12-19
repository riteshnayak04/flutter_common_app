import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/get_data_model.dart';

class StreamGetDataDetailsPage extends StatelessWidget {
  final GetDataModel getDataModel;
  const StreamGetDataDetailsPage({
    super.key,
    required this.getDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Get Data Details'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            backgroundImage: NetworkImage(getDataModel.avatar),
          ),
          const SizedBox(height: 20),
          Text(
            '${getDataModel.firstName} ${getDataModel.lastName}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            getDataModel.email,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            getDataModel.id.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
