import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/features/details/presentation/pages/DetailsPage.dart';
import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/datasources/apiServicesNowShowing.dart';
import 'package:myapp/features/home/data/repositories/now_showing_repository_impl.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';

int _page = 1;

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  final ScrollController _scrollcontroller = ScrollController();

  void initState() {
    bool _callnewpage = false;

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
          });
        }
      });
    });
  }

  List moviegenres = [
    "Action",
    "adventure",
  ];
  @override
  Widget build(BuildContext context) {
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
                            poster_path: movieList[index].posterPath!,
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
                                child: ListView.builder(
                                    itemCount: moviegenres.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        height: height * 0.035,
                                        width: width * 0.2,
                                        margin: EdgeInsets.only(
                                          right: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color.fromARGB(
                                              255, 207, 218, 247),
                                        ),
                                        child: Center(
                                          child: Text(
                                            moviegenres[index],
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 143, 170, 245)),
                                          ),
                                        ),
                                      );
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
