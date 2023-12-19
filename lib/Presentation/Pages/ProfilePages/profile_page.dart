import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Logic/Providers/drop_down_provider.dart';
import 'package:flutter_common_widgets/Presentation/Pages/HomePages/home_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> locations = ['A', 'B', 'C', 'D']; // Option 2
  String? selectedLocation; // Option 2
  int? value;
  @override
  Widget build(BuildContext context) {
    print('### ProfilePage build method called ###');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PopupMenuButton(
              elevation: 1.0,
              position: PopupMenuPosition.under,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: const Text('Edit'),
                    onTap: () {
                      if (value == 1) {
                        setState(() {
                          print('### Edit ###');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        });
                      }
                    },
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: const Text('Delete'),
                    onTap: () {
                      if (value == 2) {
                        setState(() {
                          print('### Delete ###');
                        });
                      }
                    },
                  ),
                ];
              },
            ),
            const SizedBox(height: 100),
            Consumer<DropdownButtonProvider>(
                builder: (context, popValue, child) {
              return PopupMenuButton(
                elevation: 1.0,
                position: PopupMenuPosition.under,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 1,
                      child: const Text('Edit'),
                      onTap: () {
                        if (value == 1) {
                          popValue.changeValue(value!);
                          print('### Edit ###');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      },
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const Text('Delete'),
                      onTap: () {
                        if (value == 2) {
                          popValue.changeValue(value!);
                          print('### Delete ###');
                        }
                      },
                    ),
                  ];
                },
              );
            }),
            const SizedBox(height: 100),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width * 1.0,
              height: 55,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isDense: true,
                  isExpanded: true,
                  hint: const Text(
                      'Please choose a location'), // Not necessary for Option 1
                  value: selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      selectedLocation = newValue;
                    });
                  },
                  items: locations.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Consumer<DropdownButtonProvider>(
                builder: (context, dropValue, child) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width * 1.0,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[400]!,
                      width: 1.5,
                    ),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    itemHeight: 55.0,
                    elevation: 0,
                    dropdownColor: Colors.pink[50],
                    isDense: true,
                    isExpanded: true,
                    hint: const Text('Select Gender'),
                    value: dropValue.selectedGender,
                    onChanged: (newValue) {
                      print('### selectedGender $newValue ###');
                      dropValue.changeLocation(newValue);
                    },
                    items: dropValue.gender.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
