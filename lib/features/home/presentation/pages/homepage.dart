import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: Color(0xFF201d52),
                ),
                Text(
                  "FilmKu",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF201d52),
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.notifications,
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
                  itemCount: movie_posters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: height * 0.35,
                          width: width * 0.4,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/" + movie_posters[index]),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          movie_names[index],
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
                            Text("8.1/10"),
                            SizedBox(
                              width: 3,
                            ),
                            Text("IMDB"),
                          ],
                        ),
                      ],
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
                  height: height * 0.30,
                  width: width,
                  child: ListView.builder(
                      itemCount: movie_posters.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              height: height * 0.3,
                              width: width * 0.4,
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/" + movie_posters[index]),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie_names[index],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF201d52),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  movie_names[index],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF201d52),
                                      fontWeight: FontWeight.bold),
                                ),
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
