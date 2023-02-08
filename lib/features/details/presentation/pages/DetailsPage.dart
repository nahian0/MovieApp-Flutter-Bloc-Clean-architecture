import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  List moviegenres = ["Action", "adventure", "comedy", "drama"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: height * 0.40,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/1917_landscape.jpeg"),
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
                    Text(
                      "1917",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.bookmark_outline_outlined,
                      size: 30,
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
                      "8.1/10",
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
                    itemCount: moviegenres.length,
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
                            moviegenres[index],
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
                margin: EdgeInsets.only(top: height * 0.04, left: width * 0.05),
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
                child: Text(
                  "As an infantry battalion assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    ));
  }
}
