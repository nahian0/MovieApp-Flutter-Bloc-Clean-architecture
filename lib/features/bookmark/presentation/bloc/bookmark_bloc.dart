import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/bookmark/domain/repositories/bookmarks_Repository.dart';
import 'package:myapp/features/bookmark/domain/usecases/delateBookmarkitem.dart';

import 'package:myapp/features/bookmark/domain/usecases/getBookmarksdata.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(BookmarkInitial()) {
    GetBookmarksdatausecase getBookmarksdatausecase = GetBookmarksdatausecase(
        bookmarksRepository: locator<BookmarksRepository>());
    DelateBookmarksusecase delateBookmarksusecase = DelateBookmarksusecase(
        bookmarksRepository: locator<BookmarksRepository>());
    List<Map<String, dynamic>> _bookmarks = [];

    on<loadBookmarksdata>((event, emit) async {
      emit(BookmarkInitial());
      _bookmarks = await getBookmarksdatausecase();
      emit(bookmarkDataloaded(_bookmarks));
    });
    on<delateBookmarkdata>((event, emit) async {
      print(event.id);
      await delateBookmarksusecase(event.id);
      _bookmarks = await getBookmarksdatausecase();
      emit(bookmarkDataloaded(_bookmarks));
    });
  }
}
