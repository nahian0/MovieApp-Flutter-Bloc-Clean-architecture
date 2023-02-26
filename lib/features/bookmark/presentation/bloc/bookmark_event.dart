part of 'bookmark_bloc.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class loadBookmarksdata extends BookmarkEvent {}

class delateBookmarkdata extends BookmarkEvent {
  int id;
  delateBookmarkdata(this.id);
  @override
  List<Object> get props => [id];
}
