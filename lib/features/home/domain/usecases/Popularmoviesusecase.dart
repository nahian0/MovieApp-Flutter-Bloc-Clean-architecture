import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/domain/usecases/homepageusecase.dart';

import '../../data/models/testmodel.dart';

class PopularMovieUsecase extends HomepageUsecase {
  PopularMovieUsecase(super.homePageRepositories);
  Future<List<PopularMovieModel>> call({required int page}) async {
    var response = homePageRepositories.getpopularmovies(page);
    // print('bello');
    // print(response);
    return response;
  }
}
