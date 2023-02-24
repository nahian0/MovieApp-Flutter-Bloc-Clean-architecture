import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myapp/core/di/app_component.dart';
import 'package:myapp/features/home/data/models/NowPlayingModel.dart';
import 'package:myapp/features/home/domain/repositories/Home_page_Repositorie.dart';
import 'package:myapp/features/home/domain/usecases/NowplayinUsecase.dart';

part 'nowshowing_event.dart';
part 'nowshowing_state.dart';

class NowshowingBloc extends Bloc<NowshowingEvent, NowshowingState> {
  int page = 1;
  NowplayingUsecase _nowplayingUsecase =
      NowplayingUsecase(locator<HomePageRepositories>());
  NowshowingBloc(this._nowplayingUsecase) : super(NowshowingDataLoading()) {
    List<NowPlayingMovieModel> nowplaying = [];
    on<Loadnowplayingdata>(
      (event, emit) async {
        emit(NowshowingDataLoading());
        try {
          nowplaying = await _nowplayingUsecase(page: page);
          print(nowplaying);
          emit(NowshowingDataLoaded(nowplaying));
        } catch (e) {
          print(e);
        }
      },
    );
    on<LoadnextpageData>(
      (event, emit) async {
        print('hello');
        page = page + 1;
        nowplaying = nowplaying + await _nowplayingUsecase(page: page);
        emit(NowshowingDataLoaded(nowplaying));
      },
    );
  }
}
