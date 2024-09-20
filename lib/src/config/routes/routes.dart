import 'package:flutter/material.dart';
import 'package:worldline_flutter_app/src/features/poi_list/domain/entity/poi_entity.dart';
import 'package:worldline_flutter_app/src/features/poi_list/presentation/pages/poi_detail_view.dart';
import 'package:worldline_flutter_app/src/features/poi_list/presentation/pages/poi_list_view.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const PoiListView());

      case '/PoiDetails':
        return _materialRoute(
            PoiDetailsView(poi: settings.arguments as PoiEntity));

      default:
        return _materialRoute(const PoiListView());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
