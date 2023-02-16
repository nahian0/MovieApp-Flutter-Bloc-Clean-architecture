import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';

class ApiServiceNowPlaying {
  final Dio _dio = Dio();

  final String baseurl = 'https://api.themoviedb.org/3/movie/';
  final String key = '7891436f22ccc147037bfd45c7ed95d5';

  // final String NowPlayingUrl =
  //     'https://api.themoviedb.org/3/movie/now_playing?api_key=7891436f22ccc147037bfd45c7ed95d5&language=en-US&page=1';

  Future<List<NowPlayingMovie>> getNowPlayingMovie(int page) async {
    try {
      final response = await _dio.get(baseurl +
          'now_playing?api_key=' +
          key +
          '&language=en-US&page=' +
          page.toString());
      var movies = response.data['results'] as List;
      var m = movies.map((m) => NowPlayingMovie.fromJson(m)).toList();
      movieList = movieList + m;

      //print(movieList.length);

      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
