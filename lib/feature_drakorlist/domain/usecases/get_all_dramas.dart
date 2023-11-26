import 'package:mydrakorlist/core/usecases/usecase.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/entities/drama.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/repositories/drama_repository.dart';

class GetAllDramasUseCase implements UseCase<List<DramaEntity>, void>{
  final DramaRepository _dramaRepository;

  GetAllDramasUseCase(this._dramaRepository);

  @override
  Future<List<DramaEntity>> call({void params}) {
    return _dramaRepository.getAllDramas();
  }
  
}