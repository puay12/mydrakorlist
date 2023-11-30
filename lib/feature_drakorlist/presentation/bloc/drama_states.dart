import '../../domain/entities/drama.dart';
import 'interfaces/drama_state.dart';

class DramaLoading extends DramaState{
  const DramaLoading();
}

class DramaSuccess extends DramaState{
  const DramaSuccess(List<DramaEntity> drama_lists) : super(drama_lists: drama_lists);
}

class DramaFailed extends DramaState{
  const DramaFailed(String error) : super(error: error);
}