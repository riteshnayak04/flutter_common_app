import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Providers/get_data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<GetDataProvider>(context, listen: false);
    provider.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Consumer<GetDataProvider>(
        builder: (context, getDataProvider, child) {
          if (getDataProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (getDataProvider.getDataList.isEmpty) {
              return const Center(
                child: Text('No Data'),
              );
            } else {
              return ListView.builder(
                itemCount: getDataProvider.getDataList.length,
                itemBuilder: (context, index) {
                  final data = getDataProvider.getDataList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data.avatar),
                    ),
                    title: Text('${data.firstName} ${data.lastName}'),
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
