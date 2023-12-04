import 'package:mydrakorlist/feature_drakorlist/data/data_resources/drama_remote.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/entities/drama.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/repositories/drama_repository.dart';

import '../models/drama.dart';

class DramaRepositoryImpl implements DramaRepository{
  final DramaRemoteDataSource _dramaRemoteDataSource;

  DramaRepositoryImpl(this._dramaRemoteDataSource);

  @override
  Future<List<DramaEntity>> getAllDramas() async {
    final drama_lists = await _dramaRemoteDataSource.getAllDramas();
    List<DramaEntity> results = [];

    drama_lists.forEach((element) {
      return results.add(toEntity(element));
    });

    return results;
  }

  @override
  Future<void> addOrUpdate(DramaEntity drama) async {
    final drama_doc = toMap(drama);
    await _dramaRemoteDataSource.addOrUpdate(drama_doc);
  }

  @override
  Future<void> delete(DramaEntity drama) async {
    final drama_doc = toMap(drama);
    await _dramaRemoteDataSource.delete(drama_doc);
  }

  DramaEntity toEntity(DramaModel model){
    return DramaEntity(
      id: model.id,
      title: model.title,
      genre: model.genre,
      synopsis: model.synopsis,
      imdbRate: model.imdbRate,
      jmlhEps: model.jmlhEps,
      status: model.status,
      posterImage: model.posterImage,
      myReview: model.myReview,
    );
  }

  Map<String, dynamic> toMap(DramaEntity drama) {
    return {
      'id': drama.id ?? "",
      'title': drama.title,
      'genre': drama.genre,
      'synopsis': drama.synopsis,
      'imdbRate': drama.imdbRate,
      'jmlhEps': drama.jmlhEps,
      'status': drama.status,
      'posterImage': drama.posterImage,
      'myReview': drama.myReview
    };
  }
}