import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/features/bookmark/presentation/pages/bookmarks.dart';
import 'package:myapp/features/home/presentation/pages/homepage.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: height * 0.1),
          ),
          ListTile(
            title: const Text('Home',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => homepage()),
              );
            },
          ),
          ListTile(
            title: const Text('Bookmark',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BookmarkPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
