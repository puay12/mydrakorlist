import 'package:mydrakorlist/feature_drakorlist/domain/entities/drama.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/interfaces/drama_event.dart';

import 'interfaces/drama_event.dart';

class GetAllDramas extends DramaEvent{
  GetAllDramas();
}

class AddUpdateDrama extends DramaEvent{
  AddUpdateDrama(DramaEntity drama) : super(drama: drama);
}