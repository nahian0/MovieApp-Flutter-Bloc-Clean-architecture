// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/details/presentation/pages/DetailsPage.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/NowplayinUsecase.dart';
import 'package:myapp/features/home/domain/usecases/Popularmoviesusecase.dart';
import 'package:myapp/features/home/presentation/bloc/nowshowingbloc/nowshowing_bloc.dart';
import 'package:myapp/features/home/presentation/pages/homepage.dart';
import 'package:myapp/features/home/presentation/pages/splashscreen.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';

List<NowPlayingMovieModel> NowplayingmovieList = [];

int _page = 1;

class NowShowing extends StatefulWidget {
  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  NowplayingUsecase _nowplayingUsecase =
      NowplayingUsecase(locator<HomePageRepositories>());

  bool _callnewpage = false;
  final ScrollController _scrollcontroller = ScrollController();

  void initState() {
    //print(movieList[0].genre_ids);

    _scrollcontroller.addListener(() {
      setState(() {
        _callnewpage = _scrollcontroller.offset >
                _scrollcontroller.position.maxScrollExtent - 500
            ? true
            : false;
        if (_callnewpage == true) {
          setState(() {
            _page = _page + 1;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NowshowingBloc(_nowplayingUsecase)..add(Loadnowplayingdata()),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Now Showing",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF201d52),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: Center(child: Text("See more"))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              BlocBuilder<NowshowingBloc, NowshowingState>(
                builder: (context, state) {
                  if (state is NowshowingDataLoaded) {
                    NowplayingmovieList = state.Nowshowingmovies;

                    return Container(
                      height: height * 0.45,
                      width: width,
                      child: ListView.builder(
                          itemCount: NowplayingmovieList.length,
                          scrollDirection: Axis.horizontal,
                          controller: _scrollcontroller,
                          itemBuilder: (BuildContext context, int index) {
                            if (_callnewpage == true) {
                              context
                                  .read<NowshowingBloc>()
                                  .add(LoadnextpageData());
                              _callnewpage = false;
                            }
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          homepage() // Detailspage(
                                      //   title: NowplayingmovieList[index].title!,
                                      //   description:
                                      //       NowplayingmovieList[index].overview!,
                                      //   average_vote:
                                      //       NowplayingmovieList[index].voteAverage!,
                                      //   backdroppictures: NowplayingmovieList[index]
                                      //       .backdropPath!,
                                      //   poster_path:
                                      //       NowplayingmovieList[index].posterPath!,
                                      //   movieindex: index,
                                      // ),
                                      ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: height * 0.35,
                                    width: width * 0.4,
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            'https://image.tmdb.org/t/p/w500/' +
                                                NowplayingmovieList[index]
                                                    .posterPath!,
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    height: height * 0.05,
                                    width: width * 0.4,
                                    child: Center(
                                      child: Text(
                                        //movieList[index].title,
                                        NowplayingmovieList[index].title!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF201d52),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                          NowplayingmovieList[index]
                                                  .voteAverage! +
                                              "/10",
                                          style: TextStyle(color: Colors.grey)),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text("IMDB",
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
