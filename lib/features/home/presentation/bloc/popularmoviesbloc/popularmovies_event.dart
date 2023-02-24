part of 'popularmovies_bloc.dart';

abstract class PopularmoviesEvent extends Equatable {
  const PopularmoviesEvent();

  @override
  List<Object> get props => [];
}

class loadPopularmoviesdata extends PopularmoviesEvent {}

class LoadnextpageData extends PopularmoviesEvent {}
