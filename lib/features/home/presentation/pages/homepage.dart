import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/data/source/GenresListLocalDatabase.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/NowplayinUsecase.dart';
import 'package:myapp/features/home/domain/usecases/Popularmoviesusecase.dart';
import 'package:myapp/features/home/presentation/widgets/Navbar.dart';
import 'package:myapp/features/home/presentation/widgets/NowShowing.dart';
import 'package:myapp/features/home/presentation/widgets/Popular.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';
import '../../../details/presentation/pages/DetailsPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // ignore: prefer_final_fields
  NowplayingUsecase _nowplayingUsecase =
      NowplayingUsecase(locator<HomePageRepositories>());
  // ignore: prefer_final_fields
  PopularMovieUsecase _popularMovieUsecase =
      PopularMovieUsecase(locator<HomePageRepositories>());

  // ignore: prefer_final_fields
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> _GenreList = [];

  void _LoadGenreList() async {
    final data = await GenresLocalDb.getGenres();
    setState(() {
      _GenreList = data;
    });
    print(_GenreList);

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
    Size size = MediaQuery.of(context).size;
    double height = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;

    screensize(h: height, w: width);
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
                Container(height: height * 0.55, child: NowShowing()),
                Container(height: height * 0.5, child: PopularMovies())

                // Container(color: Colors.amber, child: PopularMovies())
              ],
            ),
          ),
        ));
  }
}
