import 'package:myapp/features/home/data/models/GenresModel.dart';
import 'package:myapp/features/home/domain/usecases/homepageusecase.dart';

class genreslistusecase extends HomepageUsecase {
  genreslistusecase(super.homePageRepositories);
  Future<List<Genres_Model>> call() async {
    var response = homePageRepositories.getGenres();
    return response;
  }
}
