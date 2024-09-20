import 'package:worldline_flutter_app/src/features/poi_list/data/models/poi_model.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_list_entity.dart';

class PoiListModel extends PoiListEntity {
  const PoiListModel({
    List<PoiModel>? poiList,
  }) : super(poiList);

  factory PoiListModel.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<PoiModel> poiList = list.map((i) => PoiModel.fromJson(i)).toList();
    return PoiListModel(poiList: poiList);
  }

  factory PoiListModel.fromEntity(PoiListEntity entity) {
    return PoiListModel(
      poiList: entity.poiList?.map((e) => PoiModel.fromEntity(e)).toList(),
    );
  }
}
