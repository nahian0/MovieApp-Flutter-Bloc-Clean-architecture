// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:myapp/features/home/data/datasources/ApiServiceGenres.dart';
import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/GenresModel.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';

abstract class HomePageRepositories {
  final ApiServiceNowPlaying nowplayingapi;
  final ApiServicePopularMovies popularapi;
  ApiServiceGenresList genresapi;
  HomePageRepositories(
    this.nowplayingapi,
    this.popularapi,
    this.genresapi,
  );
  Future<List<NowPlayingMovieModel>> getNowPlayingMovie(int page);
  Future<List<PopularMovieModel>> getpopularmovies(int page);
  Future<List<Genres_Model>> getGenres();
}
