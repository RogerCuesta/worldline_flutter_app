import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:worldline_flutter_app/src/features/poi_list/data/data_sources/local/DAO/poi_dao.dart';
import 'package:worldline_flutter_app/src/features/poi_list/data/models/poi_model.dart';

part 'poi_database.g.dart';

@Database(version: 1, entities: [PoiModel])
abstract class AppDatabase extends FloorDatabase {
  PoiDao get poiDAO;
}
