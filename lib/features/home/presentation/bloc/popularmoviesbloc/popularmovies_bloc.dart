import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/Popularmoviesusecase.dart';

part 'popularmovies_event.dart';
part 'popularmovies_state.dart';

List<PopularMovieModel> p = [];

class PopularmoviesBloc extends Bloc<PopularmoviesEvent, PopularmoviesState> {
  int _page = 1;

  PopularMovieUsecase _popularMovieUsecase =
      PopularMovieUsecase(locator<HomePageRepositories>());

  PopularmoviesBloc(this._popularMovieUsecase)
      : super(PopularmoviesdataLoading()) {
    on<PopularmoviesEvent>((event, emit) async {
      emit(PopularmoviesdataLoading());
      try {
        p = await _popularMovieUsecase(page: _page);
        print(p);
        emit(popularmoviesdataloaded(p));
      } catch (e) {
        print(e);
      }
    });

    on<LoadnextpageData>(
      (event, emit) async {
        print('hello');
        _page = _page + 1;

        p = p + await _popularMovieUsecase(page: _page);
        print(p.length);
        emit(popularmoviesdataloaded(p));
      },
    );
  }
}
