import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/bookmark/presentation/pages/bookmarks.dart';
import 'package:myapp/features/details/presentation/pages/DetailsPage.dart';
import 'package:myapp/features/home/presentation/pages/CustomScroll.dart';
import 'package:myapp/features/home/presentation/pages/homepage.dart';

import 'features/home/presentation/pages/splashscreen.dart';

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
      home: MyStatefulWidget(),
      onInit: () {
        Get.put(AppComponent());
      },
    );
  }
}
