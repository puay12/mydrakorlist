import 'package:equatable/equatable.dart';

class DramaEntity extends Equatable{
  final String? id;
  final String? title;
  final String? genre;
  final String? synopsis;
  final String? imdbRate;
  final String? jmlhEps;
  final bool? status;
  final String? posterImage;
  final String? myReview;

  DramaEntity({
    this.id,
    this.title,
    this.genre,
    this.synopsis,
    this.imdbRate,
    this.jmlhEps,
    this.status,
    this.posterImage,
    this.myReview
  });

  @override
  List< Object ? > get props{
    return[
      id,
      title,
      genre,
      synopsis,
      imdbRate,
      jmlhEps,
      status,
      posterImage,
      myReview,
    ];
  }
}