import '../entities/drama.dart';

abstract class DramaRepository{
  Future<List<DramaEntity>> getAllDramas();
  Future<void> addOrUpdate(DramaEntity dramaEntity);
  Future<void> delete(DramaEntity DramaEntity);
}