import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Logic/Providers/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(builder: (context, value, child) {
      return Scaffold(
        body: value.pages[value.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: value.currentIndex,
          onTap: (index) {
            value.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_history), label: 'Location'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      );
    });
  }
}
