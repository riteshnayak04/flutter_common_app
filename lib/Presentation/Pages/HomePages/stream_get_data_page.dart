import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Providers/stream_get_data_provider.dart';
import 'package:flutter_common_widgets/Presentation/Pages/HomePages/stream_get_data_details_page.dart';
import 'package:provider/provider.dart';

class StreamGetDataPage extends StatefulWidget {
  const StreamGetDataPage({super.key});

  @override
  State<StreamGetDataPage> createState() => _StreamGetDataPageState();
}

class _StreamGetDataPageState extends State<StreamGetDataPage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<StremGetDataProvider>(context, listen: false);
    provider.getStremData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Get Data'),
      ),
      body: Consumer<StremGetDataProvider>(
        builder: (context, getDataProvider, child) {
          return StreamBuilder(
            stream: getDataProvider.streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Center(
                    child: Text('No Data'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: getDataProvider.getDataList.length,
                    itemBuilder: (context, index) {
                      final data = getDataProvider.getDataList[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StreamGetDataDetailsPage(
                                getDataModel: data,
                              ),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data.avatar),
                        ),
                        title: Text('${data.firstName} ${data.lastName}'),
                        subtitle: Text(data.email),
                      );
                    },
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
