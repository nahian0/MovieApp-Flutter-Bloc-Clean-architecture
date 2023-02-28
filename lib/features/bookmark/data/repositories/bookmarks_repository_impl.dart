import 'package:myapp/core/data/source/bookmarkLocalDatabase.dart';
import 'package:myapp/features/bookmark/domain/repositories/bookmarks_Repository.dart';

class BookmarkRepositoryImpl extends BookmarksRepository {
  @override
  Future<int> delateItem(int id) async {
    print('delate');
    print(id);
    await BookmarkLocalDb.deleteItem(id);

    return 0;
  }

  @override
  Future<List> getItems() async {
    var response = await BookmarkLocalDb.getItems();

    return response;
  }
}
