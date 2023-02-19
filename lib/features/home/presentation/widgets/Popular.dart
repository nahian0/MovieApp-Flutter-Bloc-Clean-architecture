import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/features/details/presentation/pages/DetailsPage.dart';
import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/repositories/GenresListLocalDatabase.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';

int _page = 1;

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  final ScrollController _scrollcontroller = ScrollController();
  bool showgenres = false;

  // final Stream<int> _bids = (() {
  //   late final StreamController<int> controller;
  //   controller = StreamController<int>(
  //     onListen: () async {
  //       await Future<void>.delayed(const Duration(seconds: 1));
  //       controller.add(1);
  //       await Future<void>.delayed(const Duration(seconds: 1));
  //       await controller.close();
  //     },
  //   );
  //   return controller.stream;
  // })();

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 5),
    () => 'Data Loaded',
  );

  Future<void> getgenresfromlocaldb(int len) async {
    int i = 0;
  }

  // Future<String> getAllgenreByid(int index, int i) async {
  //   String _temp = '';
  //   List _genres = [];
  //   List<Map<String, dynamic>> _genre = [];
  //   final gen =
  //       await GenresLocalDb.getGenre(PopularmovieList[index].genreIds![i]);
  //   _genre = await gen;

  //   _temp = await _genre[0]['name'];

  //   //print(_temp);

  //   return _temp;

  //   //_temp.add(_genre[0]['name']);
  // }

  void fetchgenres() async {
    List _tempgenreList = [];
    for (int i = 0; i < PopularmovieList.length; i++) {
      //print(i);
      List _tempgenre = [];

      for (int j = 0; j < PopularmovieList[i].genreIds!.length; j++) {
        final _genid;
        _genid = PopularmovieList[i].genreIds![j];
        //print(_genid);

        final gen = await GenresLocalDb.getGenre(_genid);

        //print(gen);

        _tempgenre.add(gen[0]['name']);
        // print(_tempgenre);
      }
      _tempgenreList.add(_tempgenre);
    }
    PopularmoviesallgenresList = _tempgenreList;

    //print(PopularmoviesallgenresList);
  }

  void initState() {
    bool _callnewpage = false;
    getgenresfromlocaldb(0);
    fetchgenres();

    _scrollcontroller.addListener(() {
      setState(() {
        _callnewpage = _scrollcontroller.offset >
                _scrollcontroller.position.maxScrollExtent - 5
            ? true
            : false;
        if (_callnewpage == true) {
          setState(() {
            final service = ApiServicePopularMovies();

            _page = _page + 1;

            service.getPopularMovie(_page);
            fetchgenres();
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (PopularmoviesallgenresList.length == PopularmovieList.length) {
      setState(() {
        showgenres = true;
      });
    } else {
      setState(() {
        showgenres = false;
      });
    }

    return Column(
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
            Container(
              height: height * 0.34,
              width: width,
              child: ListView.builder(
                  itemCount: PopularmovieList.length,
                  scrollDirection: Axis.vertical,
                  controller: _scrollcontroller,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detailspage(
                            title: PopularmovieList[index].title!,
                            description: PopularmovieList[index].overview!,
                            average_vote: PopularmovieList[index].voteAverage!,
                            backdroppictures:
                                PopularmovieList[index].backdropPath!,
                            poster_path: PopularmovieList[index].posterPath!,
                            movieindex: index,
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height * 0.22,
                            width: width * 0.25,
                            margin:
                                EdgeInsets.only(top: 10, bottom: 10, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    'https://image.tmdb.org/t/p/w500/' +
                                        PopularmovieList[index].posterPath!,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.4,
                                child: Text(
                                  PopularmovieList[index].title!,
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
                                      PopularmovieList[index].voteAverage! +
                                          "/10",
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text("IMDB",
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                              Container(
                                height: height * 0.03,
                                width: width * 0.5,
                                margin: EdgeInsets.only(top: height * 0.02),
                                child: FutureBuilder<Object>(
                                    future: _calculation,
                                    builder: (context, snapshot) {
                                      return ListView.builder(
                                          itemCount: PopularmovieList[index]
                                              .genreIds!
                                              .length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder:
                                              (BuildContext context, int i) {
                                            // String a = '';
                                            // Future<void> foo() async {
                                            //   a = await getAllgenreByid(index, i);

                                            //   print(
                                            //       a); // here will be printed patientPhone numbers.
                                            // }

                                            // foo();

                                            return Container(
                                              child: showgenres == true
                                                  ? Container(
                                                      child: PopularmoviesallgenresList[
                                                                      index][i]
                                                                  .toString()
                                                                  .length <=
                                                              10
                                                          ? Container(
                                                              height: height *
                                                                  0.035,
                                                              width:
                                                                  width * 0.2,
                                                              margin: EdgeInsets
                                                                  .only(
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
                                                                child: snapshot
                                                                        .hasData
                                                                    ? Container(
                                                                        child: Text(
                                                                            //
                                                                            PopularmoviesallgenresList[index][i]),
                                                                      )
                                                                    : Container(),
                                                              ),
                                                            )
                                                          : Container(
                                                              height: height *
                                                                  0.035,
                                                              width:
                                                                  width * 0.3,
                                                              margin: EdgeInsets
                                                                  .only(
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
                                                                child: snapshot
                                                                        .hasData
                                                                    ? Container(
                                                                        child: Text(
                                                                            //
                                                                            PopularmoviesallgenresList[index][i]),
                                                                      )
                                                                    : Container(),
                                                              ),
                                                            ),
                                                    )
                                                  : Container(),
                                            );
                                          });
                                    }),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: height * 0.01),
                                    child: Icon(
                                      Icons.access_time_outlined,
                                      size: 15,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: width * 0.01),
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
            ),
          ],
        )
      ],
    );
  }
}
