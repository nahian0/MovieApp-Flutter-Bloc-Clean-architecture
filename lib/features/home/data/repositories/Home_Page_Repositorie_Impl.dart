import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';

class HomePageRepositoryImpl extends HomePageRepositories {
  HomePageRepositoryImpl(
      ApiServiceNowPlaying nowplayingapi, ApiServicePopularMovies popularapi)
      : super(nowplayingapi, popularapi);
  @override
  Future<List<NowPlayingMovieModel>> getNowPlayingMovie(int page) async {
    List<NowPlayingMovieModel> apiResponse =
        await nowplayingapi.getNowPlayingMovie(page);
    return apiResponse;
  }

  @override
  Future<List<PopularMovieModel >> getpopularmovies(int page) async {
    List<PopularMovieModel > apiResponse = await popularapi.getPopularMovie(page);
    return apiResponse;

  }
}
