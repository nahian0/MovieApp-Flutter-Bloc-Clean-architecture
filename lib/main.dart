import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/home/presentation/pages/homepage.dart';

void main() {
  AppComponent().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onInit: () {
        Get.put(AppComponent());
      },
    );
  }
}
