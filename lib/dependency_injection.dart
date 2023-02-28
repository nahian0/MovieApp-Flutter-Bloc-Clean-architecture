import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/bookmark/data/repositories/bookmarks_repository_impl.dart';
import 'package:myapp/features/bookmark/domain/repositories/bookmarks_Repository.dart';
import 'package:myapp/features/details/domain/repositories/details_repository.dart';
import 'package:myapp/features/home/data/datasources/ApiServiceGenres.dart';
import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/data/repositories/Home_Page_Repositorie_Impl.dart';
import 'package:myapp/features/home/domain/usecases/NowplayinUsecase.dart';
import 'package:myapp/features/home/domain/usecases/Popularmoviesusecase.dart';
import 'package:myapp/features/home/domain/usecases/genreslistusecase.dart';
import 'package:myapp/features/home/presentation/bloc/nowshowingbloc/nowshowing_bloc.dart';

import 'features/details/data/repositories/details_repository_impl.dart';
import 'features/home/domain/repositories/Home_page_Repositorie.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //use case
  sl.registerLazySingleton(
    () => NowplayingUsecase(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => Genreslistusecase(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => PopularMovieUsecase(
      sl(),
    ),
  );
//bloc
  sl.registerFactory(() => NowshowingBloc(
        sl(),
        sl(),
      ));

  sl.registerLazySingleton<HomePageRepositories>(
    () => HomePageRepositoryImpl(
      nowPlayingapi: sl(),
      popularApi: sl(),
      genresApi: sl(),
      // localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<DetailspageRepository>(
    () => detailReposotoryImpl(),
  );

  sl.registerLazySingleton<BookmarksRepository>(
    () => BookmarkRepositoryImpl(

        // localDataSource: sl(),
        ),
  );
  sl.registerFactory(
    () => ApiServiceNowPlaying(),
  );
  sl.registerFactory(
    () => ApiServicePopularMovies(),
  );
  sl.registerFactory(
    () => ApiServiceGenresList(),
  );

  // // use cases
  // sl.registerLazySingleton(
  //   () => GetNowPlayingMovies(
  //     repository: sl(),
  //   ),
  // );
  // sl.registerLazySingleton(
  //   () => GetPopularMovies(
  //     repository: sl(),
  //   ),
  // );

  // sl.registerLazySingleton(
  //   () => GetMovieDetails(
  //     repository: sl(),
  //   ),
  // );

  // // Repository
  // sl.registerLazySingleton<HomeRepository>(
  //   () => HomeRepositoryImpl(
  //     remoteDataSource: sl(),
  //     // localDataSource: sl(),
  //     networkInfo: sl(),
  //   ),
  // );

  // // Data source
  // sl.registerLazySingleton<HomeMovieRemoteDataSource>(
  //   () => HomeMovieRemoteDataSourceImpl(
  //     client: sl(),
  //   ),
  // );

  // // sl.registerLazySingleton<HomeMovieLocalDataSource>(() => LocalData )

  // sl.registerLazySingleton<NetworkInfo>(
  //   () => NetworkInfoImpl(
  //     connectionChecker: sl(),
  //   ),
  // );

  // // final db = await openDatabase();
  // // sl.registerLazySingleton(() => )
  // sl.registerLazySingleton(() => Dio());
  // sl.registerLazySingleton(() => InternetConnectionChecker());

  // bookmarkInjection();
  // detailsInjection();
}
