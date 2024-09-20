import 'package:floor/floor.dart';

import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_entity.dart';

@Entity(tableName: 'poi', primaryKeys: ['id'])
class PoiModel extends PoiEntity {
  const PoiModel({
    String? id,
    String? title,
    String? geocoordinates,
    String? image,
  }) : super(
          id,
          title,
          geocoordinates,
          image,
        );

  factory PoiModel.fromJson(Map<String, dynamic> map) {
    return PoiModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      geocoordinates: map['geocoordinates'] ?? "",
      image: map['image'] ?? "",
    );
  }

  factory PoiModel.fromEntity(PoiEntity entity) {
    return PoiModel(
      id: entity.id,
      title: entity.title,
      geocoordinates: entity.geocoordinates,
      image: entity.image,
    );
  }
}
