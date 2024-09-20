import 'package:floor/floor.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/models/poi_model.dart';

@dao
abstract class PoiDao {
  @Insert()
  Future<void> insertPoi(PoiModel poi);

  @delete
  Future<void> deletePoi(PoiModel poiModel);

  @Query('SELECT * FROM Poi')
  Future<List<PoiModel>> getPoi();

  @Query('SELECT * FROM Poi WHERE title LIKE :title')
  Stream<List<PoiModel>?> findPoiByTitle(String title);
}
