import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldline_flutter_app/src/core/resources/data_state.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/models/poi_model.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/repository/poi_repository.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/usecases/get_poi_list.dart';
import 'package:worldline_flutter_app/src/features/poi_list/presentation/cubit/poi_list_state.dart';

class PoiListCubit extends Cubit<PoiListState> {
  final GetPoiUseCase getPoiUseCase;
  final PoiRepository _poiRepository;

  PoiListCubit(this._poiRepository, {required this.getPoiUseCase})
      : super(const PoiListLoading()) {
    getPOIList();
  }

  Future<void> getPOIList() async {
    //Get the list from the API
    final dataState = await getPoiUseCase();

    if (dataState is DataSuccess &&
        dataState.data != null &&
        dataState.data!.isNotEmpty) {
      emit(PoiListDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(PoiListError(dataState.error!));
    }
  }

  Future<void> filterPOIList(String title) async {
    //Get the list from local host
    final localList = await _poiRepository.getLocalPoiList();

    //Filter the list (Can be done with a Query in the database)
    List<PoiModel> filteredList = localList.where((poi) {
      return poi.title != null &&
          poi.title!.toLowerCase().contains(title.toLowerCase());
    }).toList();

    //Emit Done or Empty depending on the result
    if (filteredList.isNotEmpty) {
      emit(PoiListDone(filteredList));
    } else if (filteredList.isEmpty) {
      emit(const PoiListEmpty());
    }
  }
}
