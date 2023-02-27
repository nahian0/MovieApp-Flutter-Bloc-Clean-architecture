import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/data/source/GenresListLocalDatabase.dart';
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
    List genreslist = [];
    on<loadPopularmoviesdata>((event, emit) async {
      emit(PopularmoviesdataLoading());
      try {
        p = await _popularMovieUsecase(page: page);
        // print(p);

        List _tempgenreList = [];
        for (int i = 0; i < p.length; i++) {
          List _tempgenre = [];

          for (int j = 0; j < p[i].genre_ids!.length; j++) {
            final _id = p[i].genre_ids![j];
            final _gen = await GenresLocalDb.getGenre(_id);
            _tempgenre.add(_gen[0]['name']);
          }
          _tempgenreList.add(_tempgenre);
        }
        genreslist = _tempgenreList;

        //print(_tempgenreList);

        emit(popularmoviesdataloaded(p, genreslist));
      } catch (e) {
        print(e);
      }
    });

    on<LoadnextpageData>(
      (event, emit) async {
        page = page + 1;
        //print(page);

        p = p + await _popularMovieUsecase(page: page);
        //print(p.length);

        List _tempgenreList = [];
        for (int i = genreslist.length; i < p.length; i++) {
          List _tempgenre = [];

          for (int j = 0; j < p[i].genre_ids!.length; j++) {
            final _id = p[i].genre_ids![j];
            final _gen = await GenresLocalDb.getGenre(_id);
            _tempgenre.add(_gen[0]['name']);
          }
          _tempgenreList.add(_tempgenre);
          // print('tempgenreslist');
          // print(_tempgenreList.length);
        }
        genreslist = genreslist + _tempgenreList;
        // print('genres length');
        // print(genreslist.length);
        emit(popularmoviesdataloaded(p, genreslist));
      },
    );
  }
}
