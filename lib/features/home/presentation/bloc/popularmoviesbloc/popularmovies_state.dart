part of 'popularmovies_bloc.dart';

abstract class PopularmoviesState extends Equatable {
  const PopularmoviesState();

  @override
  List<Object> get props => [];
}

class PopularmoviesdataLoading extends PopularmoviesState {}

class popularmoviesdataloaded extends PopularmoviesState {
  final List<PopularMovieModel> popularmovies;

  popularmoviesdataloaded(this.popularmovies);

  List<Object> get props => [popularmovies];
}
