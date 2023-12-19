import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String locationMessage = '';
  late String lat;
  late String long;
  //
  Future<void> getCurrentLocaton() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
      if (permissionGranted == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else if (permissionGranted == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        locationMessage =
            'Latitude: ${position.latitude} \nLongitude: ${position.longitude}';
      });
    }
  }

  String locationText = '';
  void getCurrentLocatonPostion() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return Future.error('Location permissions are denied');
      }
      return Future.error('Location permissions are denied');
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        locationText =
            'Latitude: ${position.latitude} \nLongitude: ${position.longitude}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationMessage),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                getCurrentLocaton();
              },
              child: const Text('Get Location'),
            ),
            const SizedBox(height: 50),
            Text(locationText),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                getCurrentLocaton();
              },
              child: const Text('Get Current Location'),
            )
          ],
        ),
      ),
    );
  }
}
