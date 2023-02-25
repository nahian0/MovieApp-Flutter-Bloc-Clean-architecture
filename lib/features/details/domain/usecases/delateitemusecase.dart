import 'package:myapp/features/details/data/repositories/details_repository_impl.dart';
import 'package:myapp/features/details/domain/usecases/detailsusecase.dart';

class Delateitemusecase extends detailsusecase {
  Delateitemusecase({required super.detailspageRepository});

  void call(String title) async {
    detailspageRepository.Delateitem(title);
  }
}
