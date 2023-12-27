import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Providers/get_single_data_provider.dart';
import 'package:provider/provider.dart';

class GetSingleDataPage extends StatefulWidget {
  const GetSingleDataPage({super.key});

  @override
  State<GetSingleDataPage> createState() => _GetSingleDataPageState();
}

class _GetSingleDataPageState extends State<GetSingleDataPage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<GetSingleDataProvider>(context, listen: false);
    provider.getSingleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Single Data'),
      ),
      body: Consumer<GetSingleDataProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (value.getSingleDataModel == null) {
              return const Center(
                child: Text('No Data'),
              );
            } else {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    value.getSingleDataModel!.avatar,
                  ),
                ),
                title: Text(
                  '${value.getSingleDataModel!.firstName} ${value.getSingleDataModel!.lastName}',
                ),
                subtitle: Text(value.getSingleDataModel!.email),
              );
            }
          }
        },
      ),
    );
  }
}
