

import 'package:flutter/cupertino.dart';

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
  }): super(
    id: id,
    title: title,
    genre: genre,
    synopsis: synopsis,
    imdbRate: imdbRate,
    jmlhEps: jmlhEps,
    status: status,
    posterImage: posterImage,
    myReview: myReview
  );

  factory DramaModel.fromJson(Map<String?, dynamic> json){
    return DramaModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      genre: json['genre'] ?? "",
      synopsis: json['synopsis'] ?? "",
      imdbRate: json['imdbRate'] ?? "",
      jmlhEps: json['jmlhEps'] ?? "",
      status: json['status'] ?? "",
      posterImage: json['posterImage'] ?? "",
      myReview: json['myReview'] ?? "",
    );
  }
}