import 'package:myapp/features/bookmark/data/repositories/bookmarks_repository_impl.dart';
import 'package:myapp/features/bookmark/domain/usecases/bookmarkusecase.dart';

class GetBookmarksdatausecase extends bookmarkusecase {
  GetBookmarksdatausecase({required super.bookmarksRepository});

  Future call() async {
    var response = await bookmarksRepository.getitems();
    return response;
  }
}
