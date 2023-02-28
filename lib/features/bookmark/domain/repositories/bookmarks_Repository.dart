abstract class BookmarksRepository {
  Future<List> getItems();
  Future<int> delateItem(int id);
}
