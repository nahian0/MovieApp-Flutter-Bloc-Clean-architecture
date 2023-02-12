import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/features/Navbar/presentation/pages/Navbar.dart';
import 'package:myapp/features/home/data/repositories/now_showing_repository_impl.dart';

import 'package:myapp/features/home/presentation/widgets/screensize.dart';
import 'package:myapp/features/home/data/datasources/Now_Showing_api.dart';

import '../../../details/presentation/pages/DetailsPage.dart';
import '../../data/models/NowPlayingMovies.dart';

class Spalashscreen extends StatefulWidget {
  const Spalashscreen({super.key});

  @override
  State<Spalashscreen> createState() => _SpalashscreenState();
}

class _SpalashscreenState extends State<Spalashscreen> {
  void initState() {
    final service = ApiService();
    service.getNowPlayingMovie();
    service.getPopularMovie();

    super.initState();
    // Timer(Duration(seconds: 1), (() {
    //   initApi().then((value) => Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: ((_) => VideoMenu()))));
    // }));
    Future.delayed(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((_) => homepage()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  List movie_posters = [
    "1917.jpg",
    "bladerunner.jpeg",
    "matrix.jpg",
    "venom.jpg"
  ];
  List movie_names = [
    "1917",
    "Blade runner",
    "matrix",
    "Venom",
  ];

  List moviegenres = [
    "Action",
    "adventure",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;

    return Scaffold(
      key: _globalKey,
      drawer: Navbar(),
      body: SafeArea(
        child: ListView(
          //scrollDirection: Axis.vertical,
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
            SizedBox(
              height: 30,
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
                  child: Center(child: Text("See more")),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: height * 0.45,
              width: width,
              child: ListView.builder(
                  itemCount: movieList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detailspage(
                              tittle: movieList[index].title,
                              description: movieList[index].overview,
                              average_vote: movieList[index].voteAverage,
                              backdroppictures: movieList[index].backdropPath,
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
                                        movieList[index].posterPath,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            //movieList[index].title,
                            movieList[index].title,
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF201d52),
                                fontWeight: FontWeight.bold),
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
                              Text(movieList[index].voteAverage + "/10",
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
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: height * 0.22,
                              width: width * 0.25,
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      'https://image.tmdb.org/t/p/w500/' +
                                          PopularmovieList[index].posterPath,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  PopularmovieList[index].title,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF201d52),
                                      fontWeight: FontWeight.bold),
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
                                        PopularmovieList[index].voteAverage +
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
                                      margin:
                                          EdgeInsets.only(top: height * 0.01),
                                      child: Icon(
                                        Icons.access_time_outlined,
                                        size: 15,
                                      ),
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: width * 0.01),
                                        child: Text("1 h 48min"))
                                  ],
                                )
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
