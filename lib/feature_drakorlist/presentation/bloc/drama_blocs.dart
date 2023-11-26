import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/usecases/get_all_dramas.dart';

import 'drama_events.dart';
import 'drama_states.dart';
import 'interfaces/drama_event.dart';
import 'interfaces/drama_state.dart';

class DramaBloc extends Bloc<DramaEvent, DramaState>{
  final GetAllDramasUseCase _getAllDramasUseCase;

  DramaBloc(this._getAllDramasUseCase) : super(const DramaLoading()){
    on <GetAllDramas> (onGetAllDramas);
  }

  void onGetAllDramas(GetAllDramas event, Emitter<DramaState> emit) async{
    final data = await _getAllDramasUseCase();

    if(data.isNotEmpty){
      emit(DramaSuccess(data!));
    } else{
      emit(DramaFailed('Error has ocurred'));
    }
  }
}