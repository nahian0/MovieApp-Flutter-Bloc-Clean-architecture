import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';

class ApiServicePopularMovies {
  final Dio _dio = Dio();

  final String baseurl = 'https://api.themoviedb.org/3/movie/';
  final String key = '7891436f22ccc147037bfd45c7ed95d5';

  // final String PopularUrl =
  //     'https://api.themoviedb.org/3/movie/now_playing?api_key=7891436f22ccc147037bfd45c7ed95d5&language=en-US&page=1';

  Future<List<PopularMovie>> getPopularMovie(int page) async {
    try {
      final response1 = await _dio.get(baseurl +
          'popular?api_key=' +
          key +
          '&language=en-US&page=' +
          page.toString());
      var Popularmovies = response1.data['results'] as List;
      var p = Popularmovies.map((m) => PopularMovie.fromJson(m)).toList();
      PopularmovieList = PopularmovieList + p;

      print(PopularmovieList.length);

      return PopularmovieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
