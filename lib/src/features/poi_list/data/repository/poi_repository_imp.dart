import 'package:dio/dio.dart';
import 'package:worldline_flutter_app/src/core/resources/data_state.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/data_sources/local/poi_database.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/data_sources/remote/poi_impl_api.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/models/poi_model.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_entity.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/repository/poi_repository.dart';

class PoiRepositoryImp implements PoiRepository {
  final PoiAPIService _poiApiService;
  final AppDatabase _appDatabase;
  PoiRepositoryImp(this._poiApiService, this._appDatabase);

  @override
  Future<DataState<List<PoiEntity>>> getPoiList() async {
    try {
      final localData = await _appDatabase.poiDAO.getPoi();
      if (localData.isNotEmpty) {
        return DataSuccess(localData);
      }

      // If there is no local data, fetch from API
      final httpResponse = await _poiApiService.getPoiList();

      if (httpResponse is DataSuccess) {
        await savePoiList(httpResponse.data!);
        return DataSuccess(httpResponse.data!);
      } else if (httpResponse is DataFailed) {
        return DataFailed(httpResponse.error!);
      } else {
        return DataFailed(DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Unknown error',
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> savePoiList(List<PoiEntity> poiList) async {
    for (var poi in poiList) {
      await _appDatabase.poiDAO.insertPoi(PoiModel.fromEntity(poi));
    }
  }

  @override
  Future<List<PoiModel>> getLocalPoiList() async {
    return _appDatabase.poiDAO.getPoi();
  }
}
