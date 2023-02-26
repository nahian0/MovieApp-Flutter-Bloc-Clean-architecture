abstract class DetailspageRepository {
  Future<List> getDetails(String title);

  Future<int> createitem(String title, String Description, String Vote_Average,
      String Poster_path);

  Future<int> Delateitem(String title);
}
