import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/data/source/GenresListLocalDatabase.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/details/presentation/pages/DetailsPage.dart';
import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/Popularmoviesusecase.dart';
import 'package:myapp/features/home/presentation/bloc/popularmoviesbloc/popularmovies_bloc.dart';
import 'package:myapp/features/home/presentation/pages/homepage.dart';
import 'package:myapp/features/home/presentation/pages/splashscreen.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';

int _page = 1;
List<PopularMovieModel> PopularmovieList = [];

class PopularMovies extends StatefulWidget {
  // List PopularmovieList;

  // PopularMovies(this.PopularmovieList);

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  final ScrollController _scrollcontroller = ScrollController();

  bool showgenres = false;
  bool _callnewpage = false;
  PopularMovieUsecase _popularMovieUsecase =
      PopularMovieUsecase(locator<HomePageRepositories>());

  // final Future<String> _calculation = Future<String>.delayed(
  //   const Duration(seconds: 5),
  //   () => 'Data Loaded',
  // );

  Future<void> getgenresfromlocaldb(int len) async {
    int i = 0;
  }

  // void fetchgenres() async {
  //   List _tempgenreList = [];
  //   for (int i = 0; i < widget.PopularmovieList.length; i++) {
  //     //print(i);
  //     List _tempgenre = [];

  //     for (int j = 0; j < widget.PopularmovieList[i].genreIds!.length; j++) {
  //       final _genid;
  //       _genid = widget.PopularmovieList[i].genreIds![j];
  //       //print(_genid);

  //       final gen = await GenresLocalDb.getGenre(_genid);

  //       //print(gen);

  //       _tempgenre.add(gen[0]['name']);
  //       // print(_tempgenre);
  //     }
  //     _tempgenreList.add(_tempgenre);
  //   }
  //   PopularmoviesallgenresList = _tempgenreList;

  //   //print(PopularmoviesallgenresList);
  // }

  void initState() {
    getgenresfromlocaldb(0);
    //fetchgenres();

    _scrollcontroller.addListener(() {
      setState(() {
        _callnewpage = _scrollcontroller.offset >
                _scrollcontroller.position.maxScrollExtent - 10
            ? true
            : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (PopularmoviesallgenresList.length == widget.PopularmovieList.length) {
    //   setState(() {
    //     showgenres = true;
    //   });
    // } else {
    //   setState(() {
    //     showgenres = false;
    //   });
    // }

    return BlocProvider(
      create: (context) =>
          PopularmoviesBloc(_popularMovieUsecase)..add(loadPopularmoviesdata()),
      child: Container(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
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
                    child: Center(child: Text("See more")),
                  )
                ],
              ),
              Row(
                children: [
                  BlocBuilder<PopularmoviesBloc, PopularmoviesState>(
                    builder: (context, state) {
                      if (state is popularmoviesdataloaded) {
                        //print(state.genreslist);
                        print('gag');
                        print(state.genreslist[0][0]);

                        return Container(
                          height: height * 0.34,
                          width: width,
                          child: ListView.builder(
                              itemCount: state.popularmovies.length,
                              scrollDirection: Axis.vertical,
                              controller: _scrollcontroller,
                              itemBuilder: (BuildContext context, int index) {
                                List tempList = state.genreslist[index];
                                if (_callnewpage == true) {
                                  context
                                      .read<PopularmoviesBloc>()
                                      .add(LoadnextpageData());
                                  _callnewpage = false;
                                }

                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Detailspage(
                                        title:
                                            state.popularmovies[index].title!,
                                        description: state
                                            .popularmovies[index].overview!,
                                        average_vote: state
                                            .popularmovies[index].voteAverage!,
                                        backdroppictures: state
                                            .popularmovies[index].backdropPath!,
                                        poster_path: state
                                            .popularmovies[index].posterPath!,
                                        movieindex: index,
                                        genreslist: tempList,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height * 0.22,
                                        width: width * 0.25,
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                'https://image.tmdb.org/t/p/w500/' +
                                                    state.popularmovies[index]
                                                        .posterPath!,
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: height * 0.05,
                                            width: width * 0.4,
                                            child: Text(
                                              state.popularmovies[index].title!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xFF201d52),
                                                  fontWeight: FontWeight.bold),
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
                                                  state.popularmovies[index]
                                                          .voteAverage! +
                                                      "/10",
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text("IMDB",
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                          Container(
                                            height: height * 0.03,
                                            width: width * 0.5,
                                            margin: EdgeInsets.only(
                                                top: height * 0.02),
                                            child: ListView.builder(
                                                itemCount: tempList.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int i) {
                                                  return Container(
                                                      child: Container(
                                                    child: tempList[i]
                                                                .toString()
                                                                .length <=
                                                            10
                                                        ? Container(
                                                            height:
                                                                height * 0.035,
                                                            width: width * 0.2,
                                                            margin:
                                                                EdgeInsets.only(
                                                              right: 10,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      207,
                                                                      218,
                                                                      247),
                                                            ),
                                                            child: Center(
                                                                child:
                                                                    Container(
                                                              child: Text(
                                                                  //
                                                                  tempList[i]
                                                                      .toString()),
                                                            )),
                                                          )
                                                        : Container(
                                                            height:
                                                                height * 0.035,
                                                            width: width * 0.3,
                                                            margin:
                                                                EdgeInsets.only(
                                                              right: 10,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      207,
                                                                      218,
                                                                      247),
                                                            ),
                                                            child: Center(
                                                                child:
                                                                    Container(
                                                              child: Text(
                                                                  //
                                                                  tempList[i]
                                                                      .toString()),
                                                            )),
                                                          ),
                                                  ));
                                                }),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: height * 0.01),
                                                child: Icon(
                                                  Icons.access_time_outlined,
                                                  size: 15,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: width * 0.01),
                                                child: Text("1 h 48min"),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
