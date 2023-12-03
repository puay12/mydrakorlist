import 'package:mydrakorlist/core/usecases/usecase.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/entities/drama.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/repositories/drama_repository.dart';

class AddUpdateDramaUseCase implements UseCase<void, DramaEntity>{
  final DramaRepository _dramaRepository;

  AddUpdateDramaUseCase(this._dramaRepository);

  @override
  Future<void> call({DramaEntity? params}) {
    return _dramaRepository.addOrUpdate(params!);
  }

}