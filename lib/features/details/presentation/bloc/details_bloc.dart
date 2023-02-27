import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/data/source/bookmarkLocalDatabase.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/dependency_injection.dart';
import 'package:myapp/features/details/data/repositories/details_repository_impl.dart';
import 'package:myapp/features/details/domain/repositories/details_repository.dart';
import 'package:myapp/features/details/domain/usecases/Createitemusecase.dart';
import 'package:myapp/features/details/domain/usecases/delateitemusecase.dart';
import 'package:myapp/features/details/domain/usecases/getItemusecase.dart';

import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    Getitemusecase getitemusecase =
        Getitemusecase(detailspageRepository: sl<DetailspageRepository>());

    Createitemusecase createitemusecase =
        Createitemusecase(detailspageRepository: sl<DetailspageRepository>());

    Delateitemusecase delateitemusecase =
        Delateitemusecase(detailspageRepository: sl<DetailspageRepository>());

    List<Map<String, dynamic>> _item = [];
    on<findmovie>((event, emit) async {
      _item = await getitemusecase(title: event.title);
      if (_item.length > 0) {
        emit(moviefound());
      } else {
        emit(movienotfound());
      }
    });

    on<addtobookmark>((event, emit) async {
      await createitemusecase(event.title, event.Description,
          event.Vote_Average, event.Poster_path);
      _item = await getitemusecase(title: event.title);
      if (_item.length > 0) {
        emit(moviefound());
      } else {
        emit(movienotfound());
      }
    });

    on<delatefrombookmark>((event, emit) async {
      delateitemusecase(event.title);
      _item = await getitemusecase(title: event.title);

      if (_item.length > 0) {
        emit(moviefound());
      } else {
        emit(movienotfound());
      }
    });
  }
}
