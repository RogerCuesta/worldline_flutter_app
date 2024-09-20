import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_entity.dart';

abstract class PoiListState extends Equatable {
  final List<PoiEntity>? poiList;
  final DioException? error;

  const PoiListState({this.poiList, this.error});

  @override
  List<Object?> get props => [poiList, error];
}

class PoiListLoading extends PoiListState {
  const PoiListLoading();
}

class PoiListDone extends PoiListState {
  const PoiListDone(List<PoiEntity> poiList) : super(poiList: poiList);
}

class PoiListError extends PoiListState {
  const PoiListError(DioException error) : super(error: error);
}

class PoiListEmpty extends PoiListState {
  const PoiListEmpty() : super();
}
