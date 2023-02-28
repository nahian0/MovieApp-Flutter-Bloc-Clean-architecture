import 'package:myapp/features/home/data/models/GenresModel.dart';
import 'package:myapp/features/home/domain/usecases/homepageusecase.dart';

class Genreslistusecase extends HomepageUsecase {
  Genreslistusecase(super.homePageRepositories);
  Future<List<GenresModel>> call() async {
    var response = await homePageRepositories.getGenres();
    return response;
  }
}
