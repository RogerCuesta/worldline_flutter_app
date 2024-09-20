import 'package:worldline_flutter_app/src/core/resources/data_state.dart';
import 'package:worldline_flutter_app/src/core/usecase/useacase.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_entity.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/repository/poi_repository.dart';

class GetPoiUseCase implements UseCase<DataState<List<PoiEntity>>, void> {
  final PoiRepository _poiRepository;

  GetPoiUseCase(this._poiRepository);

  @override
  Future<DataState<List<PoiEntity>>> call({void params}) {
    return _poiRepository.getPoiList();
  }
}
