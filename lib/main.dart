import 'package:flutter/material.dart';
import 'package:myapp/features/bookmark/presentation/pages/bookmarks.dart';
import 'package:myapp/features/details/presentation/pages/DetailsPage.dart';
import 'package:myapp/features/home/presentation/pages/homepage.dart';

import 'features/home/presentation/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}
