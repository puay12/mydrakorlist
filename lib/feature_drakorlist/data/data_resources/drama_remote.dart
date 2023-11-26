import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/drama.dart';

abstract class DramaRemoteDatabase{
  Future<List<DramaModel>> getAllDramas();
}

class DramaRemoteDatabaseImpl implements DramaRemoteDatabase{
  @override
  Future<List<DramaModel>> getAllDramas() async {
    List<DramaModel> dramaLists = [];

    try{
      final drama = await FirebaseFirestore.instance.collection('drama_lists').get();

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

}