import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/drama.dart';

abstract class DramaRemoteDataSource{
  Future<List<DramaModel>> getAllDramas();
  Future<void> addOrUpdate(Map<String, dynamic> drama);
  Future<void> delete(Map<String, dynamic> drama);
}

class DramaRemoteDataSourceImpl implements DramaRemoteDataSource{
  final db = FirebaseFirestore.instance;
  
  @override
  Future<List<DramaModel>> getAllDramas() async {
    List<DramaModel> dramaLists = [];

    try{
      final drama = await db.collection('drama_lists').get();

      drama.docs.forEach((element){
        return dramaLists.add(DramaModel.fromJson(element.data()));
      });

      return dramaLists;
    } on FirebaseException catch(e){
      print('Failed with error ${e.code}: ${e.message}');
      return dramaLists;
    } catch(e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addOrUpdate(Map<String, dynamic> drama) async {
    try{
      await db.collection('drama_lists').doc(drama['id']).set(drama);
    } on FirebaseException catch(e){
      print('Failed with error ${e.code}: ${e.message}');
    } catch(e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> delete(Map<String, dynamic> drama) async {
    try{
      await db.collection('drama_lists').doc(drama['id']).delete();
    } on FirebaseException catch(e){
      print('Failed with error ${e.code}: ${e.message}');
    } catch(e){
      throw Exception(e.toString());
    }
  }

}