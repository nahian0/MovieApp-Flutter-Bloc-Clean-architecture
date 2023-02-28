import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/domain/usecases/homepageusecase.dart';

class PopularMovieUsecase extends HomepageUsecase {
  PopularMovieUsecase(super.homePageRepositories);
  Future<List<PopularMovieModel>> call({required int page}) async {
    var response = homePageRepositories.getPopularmovies(page);
    // print('bello');
    // print(response);
    return response;
  }
}
