import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/usecases/get_all_dramas.dart';

import '../../domain/usecases/add_update_drama.dart';
import 'drama_events.dart';
import 'drama_states.dart';
import 'interfaces/drama_event.dart';
import 'interfaces/drama_state.dart';

class DramaBloc extends Bloc<DramaEvent, DramaState>{
  final GetAllDramasUseCase _getAllDramasUseCase;
  final AddUpdateDramaUseCase _addUpdateDramaUseCase;

  DramaBloc(this._getAllDramasUseCase, this._addUpdateDramaUseCase) : super(const DramaLoading()){
    on <GetAllDramas> (onGetAllDramas);
    on <AddUpdateDrama> (onAddUpdateDrama);
  }

  void onGetAllDramas(GetAllDramas event, Emitter<DramaState> emit) async{
    final data = await _getAllDramasUseCase();

    if(data.isNotEmpty){
      emit(DramaSuccess(data!));
    } else{
      emit(DramaFailed('Error has ocurred'));
    }
  }

  void onAddUpdateDrama(AddUpdateDrama event, Emitter<DramaState> emit) async{
    await _addUpdateDramaUseCase(params: event.drama);

    final updatedDramaLists = await _getAllDramasUseCase();

    if(updatedDramaLists != null){
      emit(DramaSuccess(updatedDramaLists!));
    } else{
      print('masuk sana');
      emit(DramaFailed('Error has ocurred'));
    }
  }
}