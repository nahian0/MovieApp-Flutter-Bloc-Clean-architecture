part of 'nowshowing_bloc.dart';

abstract class NowshowingState extends Equatable {
  const NowshowingState();

  @override
  List<Object> get props => [];
}

class NowshowingDataLoading extends NowshowingState {}

class NowshowingDataLoaded extends NowshowingState {
  final List<NowPlayingMovieModel> Nowshowingmovies;

  NowshowingDataLoaded(this.Nowshowingmovies);
  @override
  List<Object> get props => [Nowshowingmovies];
}

class DataLoadedSuccesfull extends NowshowingState {}
