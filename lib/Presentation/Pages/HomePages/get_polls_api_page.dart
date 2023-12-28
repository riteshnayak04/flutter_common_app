import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Providers/get_poll_api_provider.dart';
import 'package:flutter_common_widgets/Presentation/Utils/date_util.dart';
import 'package:provider/provider.dart';

class GetPollsApiPage extends StatefulWidget {
  const GetPollsApiPage({super.key});

  @override
  State<GetPollsApiPage> createState() => _GetPollsApiPageState();
}

class _GetPollsApiPageState extends State<GetPollsApiPage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<GetPollApiProvider>(context, listen: false);
    provider.getPollApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Polls Api Page'),
      ),
      body: Consumer<GetPollApiProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: value.getPollApiModelList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    DateUtil.getFormattedTimeOnly(
                        value.getPollApiModelList[index].createdOn),
                  ),
                  subtitle: Text(
                    value.getPollApiModelList[index].question,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
