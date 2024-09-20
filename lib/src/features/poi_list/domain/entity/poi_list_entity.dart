import 'package:equatable/equatable.dart';

import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_entity.dart';

class PoiListEntity extends Equatable {
  final List<PoiEntity>? poiList;

  const PoiListEntity(
    this.poiList,
  );

  @override
  List<Object?> get props => <Object?>[poiList];
}
