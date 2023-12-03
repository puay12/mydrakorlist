import 'package:get_it/get_it.dart';
import 'package:mydrakorlist/feature_drakorlist/data/data_resources/drama_remote.dart';
import 'package:mydrakorlist/feature_drakorlist/data/repositories/drama_repository_impl.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/repositories/drama_repository.dart';
import 'package:mydrakorlist/feature_drakorlist/domain/usecases/add_update_drama.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/drama_blocs.dart';

import 'domain/usecases/get_all_dramas.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //  Dependencies
  sl.registerSingleton<DramaRemoteDataSource>(DramaRemoteDataSourceImpl());

  sl.registerSingleton<DramaRepository>(DramaRepositoryImpl(sl()));

  //  Use Cases
  sl.registerSingleton<GetAllDramasUseCase>(
      GetAllDramasUseCase(sl())
  );
  
  sl.registerSingleton<AddUpdateDramaUseCase>(
    AddUpdateDramaUseCase(sl())
  );

  //  Blocs
  sl.registerFactory<DramaBloc>(
          () => DramaBloc(sl(), sl())
  );
}