import 'package:myapp/features/bookmark/domain/usecases/bookmarkusecase.dart';

class DelateBookmarksusecase extends bookmarkusecase {
  DelateBookmarksusecase({required super.bookmarksRepository});
  call(int id) async {
    print(id);
    await bookmarksRepository.delateItem(id);
  }
}
