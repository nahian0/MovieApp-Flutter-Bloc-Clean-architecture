import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/features/bookmark/presentation/pages/bookmarks.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF3a3a3a),
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 50),
            child: Text(
              "home",
              style: TextStyle(
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          GestureDetector(
            onTap: () => () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BookmarkPage()));
            },
            child: Container(
              height: height * 0.05,
              width: width * 0.3,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Bookmarks",
                style: TextStyle(
                    color: Colors.white,
                    //fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          )
        ],
      )),
    );
  }
}
