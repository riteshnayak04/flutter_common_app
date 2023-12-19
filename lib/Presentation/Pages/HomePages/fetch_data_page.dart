import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Providers/fetch_data_provider.dart';
import 'package:provider/provider.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({super.key});

  @override
  State<FetchDataPage> createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((itemStamp) {
      Provider.of<FetchDataProvider>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data1'),
      ),
      body: Consumer<FetchDataProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (value.fetchDataList.isEmpty) {
              return const Center(
                child: Text('No Data found!'),
              );
            } else {
              return ListView.builder(
                itemCount: value.fetchDataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // leading: Image.network(
                    //   value.fetchDataList[index].image,
                    //   height: 50,
                    //   width: 50,
                    // ),
                    title: Text(value.fetchDataList[index].title),
                    subtitle: Text(value.fetchDataList[index].body),
                    // trailing: Text(
                    //   '${value.fetchDataList[index].price.toDouble()}',
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
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
