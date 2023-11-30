import 'package:equatable/equatable.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/entities/drama.dart';

abstract class DramaState extends Equatable{
  final List<DramaEntity>? drama_lists;
  final String? error;

  const DramaState({this.drama_lists, this.error});

  @override
  List<Object> get props => [drama_lists!, error!];
}