part of 'nowshowing_bloc.dart';

abstract class NowshowingEvent extends Equatable {
  const NowshowingEvent();

  @override
  List<Object> get props => [];
}

class Loadnowplayingdata extends NowshowingEvent {}

class LoadnextpageData extends NowshowingEvent {}
