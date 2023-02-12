import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import '../models/NowPlayingMovies.dart';
import '../repositories/now_showing_repository_impl.dart';

class ApiService {
  final Dio _dio = Dio();

  final String NowPlayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=7891436f22ccc147037bfd45c7ed95d5&language=en-US&page=1';

  final String PopularUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=7891436f22ccc147037bfd45c7ed95d5&language=en-US&page=1';

  Future<List<NowPlayingMovie>> getNowPlayingMovie() async {
    try {
      final response = await _dio.get(NowPlayingUrl);
      var movies = response.data['results'] as List;
      movieList = movies.map((m) => NowPlayingMovie.fromJson(m)).toList();

      //print(movieList.length);

      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<PopularMovie>> getPopularMovie() async {
    try {
      final response1 = await _dio.get(PopularUrl);
      var Popularmovies = response1.data['results'] as List;
      PopularmovieList =
          Popularmovies.map((m) => PopularMovie.fromJson(m)).toList();

      print(PopularmovieList.length);

      return PopularmovieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
