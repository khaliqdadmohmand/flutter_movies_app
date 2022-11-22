import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:xmlpars/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //using getmaterial app because we are navigating between screens using GET dependency
    return GetMaterialApp(
      title: 'Flutter Animated Listview',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
