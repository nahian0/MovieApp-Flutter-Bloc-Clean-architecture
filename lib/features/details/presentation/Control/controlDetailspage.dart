// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// import 'package:myapp/core/data/source/bookmarkLocalDatabase.dart';

// class controlDetailspage extends StatefulWidget {
//   final String title;
//   controlDetailspage(
//     this.title,
//   );

//   @override
//   State<controlDetailspage> createState() => _controlDetailspageState();
// }

// class _controlDetailspageState extends State<controlDetailspage> {
//   bool isloading = true;
//   bool addedToBookmark = false;
//   List<Map<String, dynamic>> bookmarks = [];
//   List<Map<String, dynamic>> item = [];

//   void refreshBookmarks() async {
//     final data = await BookmarkLocalDb.getItems();
//     setState(() {
//       bookmarks = data;
//       isloading = false;
//     });
//   }

//   void _getMovieInfo(String title) async {
//     item = await BookmarkLocalDb.getItem(title);
//     print(item.length);
//     setState(() {
//       if (item.length > 0) {
//         print(item.length);
//         addedToBookmark = true;
//       } else {
//         addedToBookmark = false;
//       }
//     });
//   }

//   void delateitemBytitle(String title) async {
//     BookmarkLocalDb.deleteItembytitle(title);
//     refreshBookmarks();
//   }

//   void initState() {
//     super.initState();
//     refreshBookmarks();
//     getMovieInfo(widget.title);
//   }

//   void addBookmark(String Title, String Description, String Vote_Average,
//       String Poster_path) async {
//     BookmarkLocalDb.createItem(Title, Description, Vote_Average, Poster_path);
//     refreshBookmarks();
//     print(bookmarks.length);
//   }

//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
