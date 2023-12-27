import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common_widgets/Data/Providers/fetch_data_provider.dart';
import 'package:flutter_common_widgets/Data/Providers/get_data_provider.dart';
import 'package:flutter_common_widgets/Data/Providers/get_multiple_data_provider.dart';
import 'package:flutter_common_widgets/Data/Providers/get_single_data_provider.dart';
import 'package:flutter_common_widgets/Data/Providers/log_in_provider.dart';
import 'package:flutter_common_widgets/Data/Providers/stream_get_data_provider.dart';
import 'package:flutter_common_widgets/Logic/Providers/bottom_nav_bar_provider.dart';
import 'package:flutter_common_widgets/Logic/Providers/drop_down_provider.dart';
import 'package:flutter_common_widgets/Logic/Providers/otp_provier.dart';
import 'package:flutter_common_widgets/Logic/Providers/phone_provier.dart';
import 'package:flutter_common_widgets/Data/Providers/upload_image_provider.dart';
import 'package:flutter_common_widgets/Presentation/Pages/HomePages/get_multiple_data_page.dart';
import 'package:flutter_common_widgets/Presentation/Pages/HomePages/get_single_data_page.dart';
import 'package:flutter_common_widgets/Presentation/Pages/HomePages/stream_get_data_page.dart';
import 'package:flutter_common_widgets/Presentation/Pages/HomePages/upload_image_page.dart';
import 'package:flutter_common_widgets/Presentation/Pages/about_null_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetDataProvider()),
        ChangeNotifierProvider(create: (context) => LogInProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => DropdownButtonProvider()),
        ChangeNotifierProvider(create: (context) => PhoneProvider()),
        ChangeNotifierProvider(create: (context) => OtpProvider()),
        ChangeNotifierProvider(create: (context) => UploadImageProvider()),
        ChangeNotifierProvider(create: (context) => FetchDataProvider()),
        ChangeNotifierProvider(create: (context) => StremGetDataProvider()),
        ChangeNotifierProvider(create: (context) => GetSingleDataProvider()),
        ChangeNotifierProvider(create: (context) => GetMultipleDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlutterCommonWidgets',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        // home: const PhonePage(), main page
        // home: const UploadImagePage(),
        // home: const FetchDataPage(),
        // home: const StreamGetDataPage(),
        // home: const GetSingleDataPage(),
        // home: const GetMultipleDataPage(),
        home: const AboutNullPage(),
      ),
    );
  }
}
