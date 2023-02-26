// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bookmark_bloc.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class bookmarkDataloaded extends BookmarkState {
  List<Map<String, dynamic>> bookmarks = [];
  bookmarkDataloaded(
    this.bookmarks,
  );

  @override
  List<Object> get props => [bookmarks];
}
