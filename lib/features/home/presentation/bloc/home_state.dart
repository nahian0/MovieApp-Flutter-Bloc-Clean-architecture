// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class dataLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class dataLoadedState extends HomeState {
  final List<NowPlayingMovieModel> nowplayingmovielist;
  final List<PopularMovieModel> popularmovielist;

  dataLoadedState(this.nowplayingmovielist, this.popularmovielist);

  @override
  List<Object> get props => [nowplayingmovielist, popularmovielist];

  get nowplaying => null;
}

class dataErrorState extends HomeState {
  @override
  List<Object> get props => [];
}

class newpageLoadState extends HomeState {
  final List<NowPlayingMovieModel> nowplayingmovielist;
  newpageLoadState({
    required this.nowplayingmovielist,
  });
  @override
  List<Object> get props => [];
}
