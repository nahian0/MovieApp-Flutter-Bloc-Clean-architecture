import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/home/data/datasources/ApiServicePopularMovies.dart';
import 'package:myapp/features/home/data/datasources/ApiServicesNowShowing.dart';
import 'package:myapp/features/home/data/repositories/Home_Page_Repositorie_Impl.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';

final locator = GetIt.instance;

class AppComponent extends GetxController {
  Future<void> init() async {
    locator.registerFactory<ApiServiceNowPlaying>(() => ApiServiceNowPlaying());
    locator.registerFactory<ApiServicePopularMovies>(
        () => ApiServicePopularMovies());

    locator.registerFactory<HomePageRepositories>(() => HomePageRepositoryImpl(
          locator<ApiServiceNowPlaying>(),
          locator<ApiServicePopularMovies>(),
        ));
  }
}
