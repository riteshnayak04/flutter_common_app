import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Presentation/Pages/HomePages/home_page.dart';
import 'package:flutter_common_widgets/Presentation/Pages/LocationPages/location_page.dart';
import 'package:flutter_common_widgets/Presentation/Pages/ProfilePages/profile_page.dart';

class BottomNavBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _pages = [
    const HomePage(),
    const LocationPage(),
    const ProfilePage(),
  ];
  List<Widget> get pages => _pages;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
