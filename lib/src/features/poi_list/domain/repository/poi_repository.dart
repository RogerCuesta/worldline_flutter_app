import 'package:worldline_flutter_app/src/core/resources/data_state.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/models/poi_model.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_entity.dart';

abstract class PoiRepository {
  // API methods
  Future<DataState<List<PoiEntity>>> getPoiList();

  // Local methods
  Future<void> savePoiList(List<PoiEntity> poiList);

  Future<List<PoiModel>> getLocalPoiList();
}
