import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/home/data/models/PopularModel.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/Popularmoviesusecase.dart';

part 'popularmovies_event.dart';
part 'popularmovies_state.dart';

class PopularmoviesBloc extends Bloc<PopularmoviesEvent, PopularmoviesState> {
  int page = 1;

  PopularMovieUsecase _popularMovieUsecase =
      PopularMovieUsecase(locator<HomePageRepositories>());

  PopularmoviesBloc(this._popularMovieUsecase)
      : super(PopularmoviesdataLoading()) {
    List<PopularMovieModel> p = [];
    on<loadPopularmoviesdata>((event, emit) async {
      emit(PopularmoviesdataLoading());
      try {
        p = await _popularMovieUsecase(page: page);
        print(p);
        //print('bello');
        emit(popularmoviesdataloaded(p));
      } catch (e) {
        print(e);
      }
    });

    on<LoadnextpageData>(
      (event, emit) async {
        page = page + 1;
        print(page);

        p = p + await _popularMovieUsecase(page: page);
        print(p.length);
        emit(popularmoviesdataloaded(p));
      },
    );
  }
}
