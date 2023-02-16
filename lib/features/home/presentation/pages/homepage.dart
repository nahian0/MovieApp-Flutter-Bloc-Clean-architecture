import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/features/Navbar/presentation/pages/Navbar.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/repositories/GenresListLocalDatabase.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
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
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> _GenreList = [];

  void _LoadGenreList() async {
    final data = await GenresLocalDb.getGenres();
    setState(() {
      _GenreList = data;
    });
    print(_GenreList.length);

    if (_GenreList.length == 0) {
      for (int i = 0; i < Genrelist.length; i++) {
        GenresLocalDb.createGenre(Genrelist[i].id!, Genrelist[i].name!);
      }
    }
    print(_GenreList);
  }

  void initState() {
    _LoadGenreList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        drawer: Navbar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _globalKey.currentState?.openDrawer(),
                      child: Icon(
                        Icons.menu,
                        color: Color(0xFF201d52),
                      ),
                    ),
                    Text(
                      "FilmKu",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF201d52),
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.notifications_outlined,
                      color: Color(0xFF201d52),
                    )
                  ],
                ),
                Container(height: height * 0.6, child: NowShowing()),
                PopularMovies()
                // Container(color: Colors.amber, child: PopularMovies())
              ],
            ),
          ),
        ));
  }
}
