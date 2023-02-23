// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/details/presentation/pages/DetailsPage.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/NowplayinUsecase.dart';
import 'package:myapp/features/home/presentation/pages/splashscreen.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';

int _page = 1;

class NowShowing extends StatefulWidget {
  List NowplayingmovieList;
  NowShowing(this.NowplayingmovieList);

  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  final ScrollController _scrollcontroller = ScrollController();

  void getnowplayingmovie(int page) async {
    NowplayingUsecase nowplayingUsecase =
        NowplayingUsecase(locator<HomePageRepositories>());
    NowplayingmovieList =
        NowplayingmovieList + await nowplayingUsecase(page: page);
  }

  void initState() {
    bool _callnewpage = false;
    //print(movieList[0].genre_ids);

    _scrollcontroller.addListener(() {
      setState(() {
        _callnewpage = _scrollcontroller.offset >
                _scrollcontroller.position.maxScrollExtent - 10
            ? true
            : false;
        if (_callnewpage == true) {
          setState(() {
            _page = _page + 1;
            getnowplayingmovie(_page);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              height: height * 0.45,
              width: width,
              child: ListView.builder(
                  itemCount: widget.NowplayingmovieList.length,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollcontroller,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detailspage(
                              title: NowplayingmovieList[index].title!,
                              description: NowplayingmovieList[index].overview!,
                              average_vote:
                                  NowplayingmovieList[index].voteAverage!,
                              backdroppictures:
                                  NowplayingmovieList[index].backdropPath!,
                              poster_path:
                                  NowplayingmovieList[index].posterPath!,
                              movieindex: index,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.35,
                            width: width * 0.4,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    'https://image.tmdb.org/t/p/w500/' +
                                        widget.NowplayingmovieList[index]
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
                                widget.NowplayingmovieList[index].title!,
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
                                  widget.NowplayingmovieList[index]
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
            ),
          ],
        ),
      ),
    );
  }
}
