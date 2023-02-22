import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:myapp/features/home/data/models/GenresModel.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
import '../models/NowPlayingModel.dart';

class ApiServiceGenresList {
  final Dio _dio = Dio();

  final String baseurl = 'https://api.themoviedb.org/3/genre/movie/list?';
  final String key = '7891436f22ccc147037bfd45c7ed95d5';

  // final String PopularUrl =
  //     'https://api.themoviedb.org/3/movie/now_playing?api_key=7891436f22ccc147037bfd45c7ed95d5&language=en-US&page=1';

  Future<List<Genres_Model>> getGenres() async {
    try {
      final _response =
          await _dio.get(baseurl + 'api_key=' + key + '&language=en-US');
      var genres = _response.data['genres'] as List;
      Genrelist = genres.map((m) => Genres_Model.fromJson(m)).toList();

      return Genrelist;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
