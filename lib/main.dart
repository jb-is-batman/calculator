import 'package:calculator/app/locator.dart';
import 'package:calculator/ui/screens/homescreen/homescreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenView(),
    );
  }
}
