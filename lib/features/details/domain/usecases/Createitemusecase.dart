import 'package:myapp/features/details/domain/usecases/detailsusecase.dart';

class Createitemusecase extends detailsusecase {
  Createitemusecase({required super.detailspageRepository});

  call(String title, String Description, String Vote_Average,
      String Poster_path) async {
    var a = await detailspageRepository.createitem(
        title, Description, Vote_Average, Poster_path);
    return a;
  }
}
