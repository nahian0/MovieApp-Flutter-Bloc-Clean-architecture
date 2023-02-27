import 'package:myapp/features/home/data/datasources/ApiServiceGenres.dart';
import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/models/GenresModel.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/data/models/testmodel.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';

class HomePageRepositoryImpl extends HomePageRepositories {
  HomePageRepositoryImpl(ApiServiceNowPlaying nowplayingapi,
      ApiServicePopularMovies popularapi, ApiServiceGenresList genresapi)
      : super(nowplayingapi, popularapi, genresapi);
  @override
  Future<List<NowPlayingMovieModel>> getNowPlayingMovie(int page) async {
    List<NowPlayingMovieModel> apiResponse =
        await nowplayingapi.getNowPlayingMovie(page);
    return apiResponse;
  }

  @override
  Future<List<PopularMovieModel>> getpopularmovies(int page) async {
    List<PopularMovieModel> apiResponse =
        await popularapi.getPopularMovie(page);
    //print(apiResponse);
    return apiResponse;
  }

  @override
  Future<List<Genres_Model>> getGenres() async {
    List<Genres_Model> apiResponse = await genresapi.getGenres();
    return apiResponse;
  }
}
