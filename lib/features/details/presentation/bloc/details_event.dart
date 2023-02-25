// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class findmovie extends DetailsEvent {
  String title;
  findmovie({
    required this.title,
  });
}

class addtobookmark extends DetailsEvent {
  String title;
  String Description;
  String Vote_Average;
  String Poster_path;

  addtobookmark({
    required this.title,
    required this.Description,
    required this.Vote_Average,
    required this.Poster_path,
  });
}

class delatefrombookmark extends DetailsEvent {
  String title;

  delatefrombookmark({
    required this.title,
  });
}
