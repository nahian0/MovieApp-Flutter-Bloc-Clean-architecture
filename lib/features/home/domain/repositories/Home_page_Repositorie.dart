import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';

abstract class HomePageRepositories {
  final ApiServiceNowPlaying nowplayingapi;
  final ApiServicePopularMovies popularapi;
  HomePageRepositories(this.nowplayingapi, this.popularapi);
  Future<List<NowPlayingMovieModel>> getNowPlayingMovie(int page);
  Future<List<PopularMovieModel >> getpopularmovies(int page);
}
