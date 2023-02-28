// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:myapp/features/home/data/datasources/ApiServiceGenres.dart';
import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/GenresModel.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';

class HomePageRepositoryImpl extends HomePageRepositories {
  // HomePageRepositoryImpl(ApiServiceNowPlaying nowplayingapi,
  //     ApiServicePopularMovies popularapi, ApiServiceGenresList genresapi)
  //     : super(nowplayingapi, popularapi, genresapi);

  final ApiServiceNowPlaying nowPlayingapi;
  final ApiServicePopularMovies popularApi;
  final ApiServiceGenresList genresApi;
  HomePageRepositoryImpl({
    required this.nowPlayingapi,
    required this.popularApi,
    required this.genresApi,
  });

  @override
  Future<List<NowPlayingMovieModel>> getNowPlayingMovie(int page) async {
    List<NowPlayingMovieModel> apiResponse =
        await nowPlayingapi.getNowPlayingMovie(page);
    return apiResponse;
  }

  @override
  Future<List<PopularMovieModel>> getPopularmovies(int page) async {
    List<PopularMovieModel> apiResponse =
        await popularApi.getPopularMovie(page);
    //print(apiResponse);
    return apiResponse;
  }

  @override
  Future<List<GenresModel>> getGenres() async {
    List<GenresModel> apiResponse = await genresApi.getGenres();
    return apiResponse;
  }
}
