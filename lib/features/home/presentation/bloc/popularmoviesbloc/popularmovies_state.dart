// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'popularmovies_bloc.dart';

abstract class PopularmoviesState extends Equatable {
  const PopularmoviesState();

  @override
  List<Object> get props => [];
}

class PopularmoviesdataLoading extends PopularmoviesState {}

class popularmoviesdataloaded extends PopularmoviesState {
  final List<PopularMovieModel> popularmovies;
  final List genreslist;

  popularmoviesdataloaded(
    this.popularmovies,
    this.genreslist,
  );

  List<Object> get props => [popularmovies, genreslist];
}
