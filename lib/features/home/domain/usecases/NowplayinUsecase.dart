import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/domain/usecases/homepageusecase.dart';

class NowplayingUsecase extends HomepageUsecase {
  NowplayingUsecase(super.homePageRepositories);
  Future<List<NowPlayingMovieModel>> call({required int page}) async {
    var response = homePageRepositories.getNowPlayingMovie(page);
    return response;
  }
}
