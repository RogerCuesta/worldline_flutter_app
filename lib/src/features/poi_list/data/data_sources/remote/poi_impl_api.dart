import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:worldline_flutter_app/src/core/constants/constants.dart';
import 'package:worldline_flutter_app/src/core/resources/data_state.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/models/poi_list_model.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_entity.dart';

class PoiAPIService {
  final Dio _dio;

  PoiAPIService(this._dio);

  Future<DataState<List<PoiEntity>?>> getPoiList() async {
    try {
      final result = await _dio.get(
        poisAPIBaseURL,
      );
      Map<String, dynamic> json = jsonDecode(result.data);
      List<PoiEntity>? poiList = PoiListModel.fromJson(json).poiList;
      return DataSuccess(poiList);
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
        error: 'ERROR',
        requestOptions: RequestOptions(),
      ));
    }
  }
}
