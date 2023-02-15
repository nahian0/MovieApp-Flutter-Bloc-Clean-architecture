import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/features/Navbar/presentation/pages/Navbar.dart';
import 'package:myapp/features/home/data/datasources/apiServicesNowShowing.dart';
import 'package:myapp/features/home/data/repositories/now_showing_repository_impl.dart';
import 'package:myapp/features/home/presentation/widgets/NowShowing.dart';
import 'package:myapp/features/home/presentation/widgets/Popular.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';
import '../../../details/presentation/pages/DetailsPage.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: _globalKey,
        drawer: Navbar(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'FilmKu',
              style: TextStyle(
                color: Color(0xFF201d52),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     GestureDetector(
                //       onTap: () =>
                //           null, //_globalKey.currentState?.openDrawer(),
                //       child: Icon(
                //         Icons.menu,
                //         color: Color(0xFF201d52),
                //       ),
                //     ),
                //     Text(
                //       "FilmKu",
                //       style: TextStyle(
                //           fontSize: 25,
                //           color: Color(0xFF201d52),
                //           fontWeight: FontWeight.bold),
                //     ),
                //     Icon(
                //       Icons.notifications_outlined,
                //       color: Color(0xFF201d52),
                //     )
                //   ],
                // ),
                Container(height: height * 0.6, child: NowShowing()),
                PopularMovies()
                // Container(color: Colors.amber, child: PopularMovies())
              ],
            ),
          ),
        ));
  }
}
