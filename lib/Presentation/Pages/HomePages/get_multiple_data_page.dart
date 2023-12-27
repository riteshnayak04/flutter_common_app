import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Providers/get_multiple_data_provider.dart';
import 'package:provider/provider.dart';

class GetMultipleDataPage extends StatefulWidget {
  const GetMultipleDataPage({super.key});

  @override
  State<GetMultipleDataPage> createState() => _GetMultipleDataPageState();
}

class _GetMultipleDataPageState extends State<GetMultipleDataPage> {
  @override
  void initState() {
    super.initState();
    final provider =
        Provider.of<GetMultipleDataProvider>(context, listen: false);
    provider.getMultipleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Multiple Data'),
      ),
      body: Consumer<GetMultipleDataProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (value.getMultipleDataModelList.isEmpty) {
              return const Center(
                child: Text('No Data'),
              );
            } else {
              return ListView.builder(
                itemCount: value.getMultipleDataModelList.length,
                itemBuilder: (context, index) {
                  final data = value.getMultipleDataModelList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data.avatar),
                    ),
                    title: Text(
                      '${data.firstName} ${data.lastName}',
                    ),
                    subtitle: Text(data.email),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
