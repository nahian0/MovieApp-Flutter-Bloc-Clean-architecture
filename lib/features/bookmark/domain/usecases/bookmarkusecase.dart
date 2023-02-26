// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:myapp/features/bookmark/data/repositories/bookmarks_repository_impl.dart';
import 'package:myapp/features/bookmark/domain/repositories/bookmarks_Repository.dart';

abstract class bookmarkusecase {
  final BookmarksRepository bookmarksRepository;
  bookmarkusecase({
    required this.bookmarksRepository,
  });
}
