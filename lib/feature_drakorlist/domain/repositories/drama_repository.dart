import '../entities/drama.dart';

abstract class DramaRepository{
  Future<List<DramaEntity>> getAllDramas();
  // Future<DramaEntity> add(DramaEntity DramaEntity);
  // Future<DramaEntity> edit(DramaEntity DramaEntity);
  // Future<DramaEntity> delete(DramaEntity DramaEntity);
}