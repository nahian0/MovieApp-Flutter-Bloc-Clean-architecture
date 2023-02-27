import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/details/presentation/pages/DetailsPage.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/NowplayinUsecase.dart';
import 'package:myapp/features/home/domain/usecases/Popularmoviesusecase.dart';
import 'package:myapp/features/home/domain/usecases/genreslistusecase.dart';
import 'package:myapp/features/home/presentation/bloc/popularmoviesbloc/popularmovies_bloc.dart';
import 'package:myapp/features/home/presentation/widgets/Navbar.dart';
import 'package:myapp/features/home/presentation/widgets/NowShowing.dart';
import 'package:myapp/features/home/presentation/widgets/Popular.dart';
import 'package:myapp/features/home/presentation/widgets/screensize.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final ScrollController _scrollcontroller = ScrollController();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  void initState() {
    _scrollcontroller.addListener(() {
      print(_scrollcontroller.offset);
      setState(() {
        _callnewpage = _scrollcontroller.offset >
                _scrollcontroller.position.maxScrollExtent - 10
            ? true
            : false;
      });
    });
  }

  PopularMovieUsecase _popularMovieUsecase =
      PopularMovieUsecase(locator<HomePageRepositories>());
  bool _callnewpage = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;

    screensize(h: height, w: width);

    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
        key: _globalKey,
        drawer: Navbar(),
        body: BlocProvider(
          create: (context) => PopularmoviesBloc(_popularMovieUsecase)
            ..add(loadPopularmoviesdata()),
          child: SafeArea(
            child: CustomScrollView(
              controller: _scrollcontroller,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Row(
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
                      );
                    },
                    childCount: 1,
                  ),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                          height: height * 0.55,
                          width: 100,
                          alignment: Alignment.center,
                          //color: Colors.teal[100 * (index % 9)],
                          child: NowShowing());
                    },
                    childCount: 1,
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 15.0,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Popular',
                      style: TextStyle(
                        color: Color(0xFF201d52),
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),

                Container(
                  child: BlocBuilder<PopularmoviesBloc, PopularmoviesState>(
                    builder: (context, state) {
                      if (state is popularmoviesdataloaded) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              List tempList = state.genreslist[index];
                              if (_callnewpage == true) {
                                context
                                    .read<PopularmoviesBloc>()
                                    .add(LoadnextpageData());
                                _callnewpage = false;
                              }

                              return GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detailspage(
                                      title: state.popularmovies[index].title!,
                                      description:
                                          state.popularmovies[index].overview!,
                                      average_vote: state
                                          .popularmovies[index].voteAverage!,
                                      backdroppictures: state
                                          .popularmovies[index].backdropPath!,
                                      poster_path: state
                                          .popularmovies[index].posterPath!,
                                      movieindex: index,
                                      genreslist: tempList,
                                    ),
                                  ),
                                ),
                                child: Row(
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
                                                  state.popularmovies[index]
                                                      .posterPath!,
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: height * 0.05,
                                          width: width * 0.4,
                                          child: Text(
                                            state.popularmovies[index].title!,
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
                                                state.popularmovies[index]
                                                        .voteAverage! +
                                                    "/10",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text("IMDB",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                        Container(
                                          height: height * 0.03,
                                          width: width * 0.5,
                                          margin: EdgeInsets.only(
                                              top: height * 0.02),
                                          child: ListView.builder(
                                              itemCount: tempList.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int i) {
                                                return Container(
                                                    child: Container(
                                                  child: tempList[i]
                                                              .toString()
                                                              .length <=
                                                          10
                                                      ? Container(
                                                          height:
                                                              height * 0.035,
                                                          width: width * 0.2,
                                                          margin:
                                                              EdgeInsets.only(
                                                            right: 10,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    207,
                                                                    218,
                                                                    247),
                                                          ),
                                                          child: Center(
                                                              child: Container(
                                                            child: Text(
                                                                //
                                                                tempList[i]
                                                                    .toString()),
                                                          )),
                                                        )
                                                      : Container(
                                                          height:
                                                              height * 0.035,
                                                          width: width * 0.3,
                                                          margin:
                                                              EdgeInsets.only(
                                                            right: 10,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    207,
                                                                    218,
                                                                    247),
                                                          ),
                                                          child: Center(
                                                              child: Container(
                                                            child: Text(
                                                                //
                                                                tempList[i]
                                                                    .toString()),
                                                          )),
                                                        ),
                                                ));
                                              }),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: height * 0.01),
                                              child: Icon(
                                                Icons.access_time_outlined,
                                                size: 15,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: width * 0.01),
                                              child: Text("1 h 48min"),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            childCount: state.popularmovies.length,
                          ),
                        );
                      } else {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Container(
                                  height: 400,
                                  width: 100,
                                  alignment: Alignment.center,
                                  //color: Colors.teal[100 * (index % 9)],
                                  child: CircularProgressIndicator());
                            },
                            childCount: 1,
                          ),
                        );
                      }
                    },
                  ),
                ),

                // SliverFixedExtentList(
                //   itemExtent: 50.0,
                //   delegate: SliverChildBuilderDelegate(
                //     (BuildContext context, int index) {
                //       return Container(
                //           alignment: Alignment.center,
                //           color: Colors.lightBlue[100 * (index % 9)],
                //           child: PopularMovies());
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
