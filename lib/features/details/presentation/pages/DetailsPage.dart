import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/core/data/source/bookmarkLocalDatabase.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
import 'package:myapp/features/home/presentation/pages/splashscreen.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';
import 'package:sqflite/sqflite.dart';

class Detailspage extends StatefulWidget {
  String title;
  String average_vote;
  String description;
  String backdroppictures;
  String poster_path;
  int movieindex;
  List genreslist;

  Detailspage(
      {required this.average_vote,
      required this.description,
      required this.title,
      required this.backdroppictures,
      required this.poster_path,
      required this.movieindex,
      required this.genreslist});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  bool isloading = true;
  bool addedToBookmark = false;
  List<Map<String, dynamic>> _bookmarks = [];
  List<Map<String, dynamic>> _item = [];

  void _refreshBookmarks() async {
    final data = await BookmarkLocalDb.getItems();
    setState(() {
      _bookmarks = data;
      isloading = false;
    });
  }

  void _getMovieInfo(String title) async {
    _item = await BookmarkLocalDb.getItem(title);
    print(_item.length);
    setState(() {
      if (_item.length > 0) {
        print(_item.length);
        addedToBookmark = true;
      } else {
        addedToBookmark = false;
      }
    });
  }

  void _delateitemBytitle(String title) async {
    BookmarkLocalDb.deleteItembytitle(title);
    _refreshBookmarks();
  }

  void initState() {
    super.initState();
    _refreshBookmarks();
    _getMovieInfo(widget.title);
  }

  void _addBookmark(String Title, String Description, String Vote_Average,
      String Poster_path) async {
    BookmarkLocalDb.createItem(Title, Description, Vote_Average, Poster_path);
    _refreshBookmarks();
    print(_bookmarks.length);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: height * 0.40,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      'https://image.tmdb.org/t/p/w500/' +
                          widget.backdroppictures),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(
                    top: height * 0.05,
                    left: width * 0.05,
                    right: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.1,
                      width: width * 0.7,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: addedToBookmark == false
                          ? () {
                              _addBookmark(widget.title, widget.description,
                                  widget.average_vote, widget.poster_path);
                              _getMovieInfo(widget.title);
                            }
                          : () {
                              _delateitemBytitle(widget.title);
                              _getMovieInfo(widget.title);
                            },
                      child: addedToBookmark == false
                          ? Icon(
                              Icons.bookmark_outline_outlined,
                              size: 30,
                            )
                          : Icon(
                              Icons.bookmark,
                              size: 30,
                              color: Colors.yellow,
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.01,
                  left: width * 0.05,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.average_vote + "/10",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "IMDB",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.035,
                width: width,
                margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: height * 0.02),
                child: ListView.builder(
                    itemCount: widget.genreslist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: height * 0.035,
                        width: width * 0.2,
                        margin: EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 207, 218, 247),
                        ),
                        child: Center(
                          child: Text(
                            widget.genreslist[index],
                            // PopularmoviesallgenresList[widget.movieindex]
                            //     [index],
                            style: TextStyle(
                                color: Color.fromARGB(255, 143, 170, 245)),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.03, left: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Length",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Text(
                      "language",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Text(
                      "Rating",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.01, left: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "1 h 30min",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width * 0.16,
                    ),
                    Text(
                      "English",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Text(
                      "PG-13",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.02, left: width * 0.05),
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF201d52),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.01, left: width * 0.05),
                height: height * 0.20,
                width: width * 0.8,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    ));
  }
}
