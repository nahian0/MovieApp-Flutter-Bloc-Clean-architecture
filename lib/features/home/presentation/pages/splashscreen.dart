import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myapp/features/home/data/datasources/ApiServiceGenres.dart';
import 'package:myapp/features/home/data/repositories/GenresListLocalDatabase.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
import 'package:myapp/features/home/presentation/pages/homepage.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';

import '../../data/datasources/ApiServicePopularMovies.dart';
import '../../data/datasources/ApiServicesNowShowing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    final service2 = ApiServiceGenresList();
    service2.getGenres();
    final service = ApiServiceNowPlaying();
    service.getNowPlayingMovie(1);
    final service1 = ApiServicePopularMovies();
    service1.getPopularMovie(1);

    super.initState();
    // Timer(Duration(seconds: 1), (() {
    //   initApi().then((value) => Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: ((_) => VideoMenu()))));
    // }));
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: ((_) => homepage()),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;

    screensize(h: height, w: width);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
