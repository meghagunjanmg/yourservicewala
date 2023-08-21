import 'package:flutter/material.dart';
import 'package:yourservicewala/constant/ColorConstants.dart';

import 'Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: ColorConstants.darkBlueTheme,), // Change this to your desired primary color),
      home: SplashScreen(),
    );
  }
}
