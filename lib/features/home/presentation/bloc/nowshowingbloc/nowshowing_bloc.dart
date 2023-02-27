import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/data/source/GenresListLocalDatabase.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/home/data/models/GenresModel.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/data/repositories/RetrivedData.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/NowplayinUsecase.dart';
import 'package:myapp/features/home/domain/usecases/genreslistusecase.dart';

part 'nowshowing_event.dart';
part 'nowshowing_state.dart';

class NowshowingBloc extends Bloc<NowshowingEvent, NowshowingState> {
  int page = 1;
  NowplayingUsecase _nowplayingUsecase =
      NowplayingUsecase(locator<HomePageRepositories>());
  Genreslistusecase _genreslistusecase =
      Genreslistusecase(locator<HomePageRepositories>());

  NowshowingBloc(this._nowplayingUsecase, this._genreslistusecase)
      : super(NowshowingDataLoading()) {
    List<NowPlayingMovieModel> nowplaying = [];
    List<Genres_Model> genres = [];
    on<Loadnowplayingdata>(
      (event, emit) async {
        emit(NowshowingDataLoading());
        try {
          nowplaying = await _nowplayingUsecase(page: page);
          //print(nowplaying);
          genres = await _genreslistusecase();
          List data = await GenresLocalDb.getGenres();
          // print(data.length);

          if (data.length == 0) {
            for (int i = 0; i < genres.length; i++) {
              // print(data);
              GenresLocalDb.createGenre(genres[i].id!, genres[i].name!);
            }
          }

          emit(NowshowingDataLoaded(nowplaying));
        } catch (e) {
          print(e);
        }
      },
    );
    on<LoadnextpageData>(
      (event, emit) async {
        page = page + 1;
        print(page);
        nowplaying = nowplaying + await _nowplayingUsecase(page: page);
        emit(NowshowingDataLoaded(nowplaying));
      },
    );
  }
}
