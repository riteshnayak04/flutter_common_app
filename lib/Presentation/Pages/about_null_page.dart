import 'package:flutter/material.dart';

class AboutNullPage extends StatefulWidget {
  const AboutNullPage({super.key});

  @override
  State<AboutNullPage> createState() => _AboutNullPageState();
}

class _AboutNullPageState extends State<AboutNullPage> {
  String name = 'Ritesh Roxtar';
  String? nullName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Null Safety'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Name: $name',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'NullName: ${nullName ?? 'No Data'}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
