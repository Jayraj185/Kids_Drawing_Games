import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kids_drawing_games/Screens/HomeScreen/view/HomePage.dart';
import 'package:kids_drawing_games/Screens/ImageDrawScreen/View/ImageDrawPage.dart';
import 'package:kids_drawing_games/Screens/SplashScreen/view/SplashPage.dart';
import 'package:sizer/sizer.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: 'Home',
          routes: {
            '/' : (context) => SplashPage(),
            'Home' : (context) => HomePage(),
            'Draw' : (context) => ImageDrawPage(),
          },
        );
      },
    )
  );
}