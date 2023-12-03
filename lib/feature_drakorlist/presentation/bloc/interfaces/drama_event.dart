import 'package:equatable/equatable.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/entities/drama.dart';

abstract class DramaEvent extends Equatable{
  final DramaEntity? drama;

  const DramaEvent({this.drama});

  @override
  List<Object> get props => [drama!];
}