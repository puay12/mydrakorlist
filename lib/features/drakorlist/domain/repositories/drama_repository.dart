import 'package:mydrakorlist/features/drakorlist/domain/entities/drama.dart';

abstract class DramaRepository{
  //ADD DRAMA
  Future<Drama> add(Drama drama);

  //EDIT DRAMA
  Future<Drama> edit(Drama drama);

  //DELETE DRAMA
  Future<Drama> delete(Drama drama);

  //GET ALL DRAMAS
  Future<List<Drama>> getAllDramas();

  //GET DRAMAS BY STATUS
  Future<List<Drama>> getDramasByStatus();
}