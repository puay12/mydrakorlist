import 'package:mydrakorlist/feature_drakorlist/data/data_resources/drama_remote.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/repositories/drama_repository.dart';

import '../models/drama.dart';

class DramaRepositoryImpl implements DramaRepository{
  final DramaRemoteDatabase _dramaRemoteDatabase;

  DramaRepositoryImpl(this._dramaRemoteDatabase);

  @override
  Future<List<DramaModel>> getAllDramas() async {
    final results = await _dramaRemoteDatabase.getAllDramas();
    return results;
  }

  // @override
  // Future<DramaModel> add(DramaModel drama) async {
  //   // TODO: implement add
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<DramaModel> delete(DramaModel drama) async {
  //   // TODO: implement delete
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<DramaModel> edit(DramaModel drama) async {
  //   // TODO: implement edit
  //   throw UnimplementedError();
  // }
}