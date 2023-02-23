import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/NowplayinUsecase.dart';
import 'package:myapp/features/home/domain/usecases/Popularmoviesusecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // ignore: prefer_final_fields
  NowplayingUsecase _nowplayingUsecase =
      NowplayingUsecase(locator<HomePageRepositories>());

  // ignore: prefer_final_fields
  PopularMovieUsecase _popularMovieUsecase =
      PopularMovieUsecase(locator<HomePageRepositories>());

  HomeBloc(this._nowplayingUsecase, this._popularMovieUsecase)
      : super(dataLoadingState()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(dataLoadingState());
      try {
        var a = await _nowplayingUsecase(page: 1);
        var b = await _popularMovieUsecase(page: 1);
        emit(dataLoadedState(a, b));

        // ignore: empty_catches
      } catch (e) {}
    });
  }
}
