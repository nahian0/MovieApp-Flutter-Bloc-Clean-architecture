import 'package:myapp/features/details/data/repositories/details_repository_impl.dart';
import 'package:myapp/features/details/domain/usecases/detailsusecase.dart';

class Getitemusecase extends detailsusecase {
  Getitemusecase({required super.detailspageRepository});
  call({required String title}) async {
    var response = await detailspageRepository.getDetails(title);
    return response;
  }
}
