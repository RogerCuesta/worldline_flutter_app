import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/data_sources/local/poi_database.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/data_sources/remote/poi_impl_api.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/repository/poi_repository_imp.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/repository/poi_repository.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/usecases/get_poi_list.dart';
import 'package:worldline_flutter_app/src/features/poi_list/presentation/cubit/poi_list_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<PoiAPIService>(PoiAPIService(sl()));

  sl.registerSingleton<PoiRepository>(PoiRepositoryImp(sl(), sl()));

  //UseCases
  sl.registerSingleton<GetPoiUseCase>(GetPoiUseCase(sl()));

  //Blocs
  sl.registerFactory<PoiListCubit>(
      () => PoiListCubit(getPoiUseCase: sl(), sl()));
}
