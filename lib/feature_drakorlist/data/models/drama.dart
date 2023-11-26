

import '../../domain/entities/drama.dart';

class DramaModel extends DramaEntity{
  DramaModel({
    String? id,
    String? title,
    String? genre,
    String? synopsis,
    String? imdbRate,
    String? jmlhEps,
    bool? status,
    String? posterImage,
    String? myReview,
  });

  factory DramaModel.fromJson(Map<String, dynamic> json){
    return DramaModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      genre: json['genre'] ?? "",
      synopsis: json['synopsis'] ?? "",
      imdbRate: json['imdbRate'] ?? "",
      status: json['status'] ?? "",
      posterImage: json['posterImage'] ?? "",
      myReview: json['myReview'] ?? "",
    );
  }
}