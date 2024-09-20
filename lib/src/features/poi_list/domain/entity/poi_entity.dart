import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class PoiEntity extends Equatable {
  @primaryKey
  final String? id;

  final String? title;

  final String? geocoordinates;

  final String? image;

  const PoiEntity(
    this.id,
    this.title,
    this.geocoordinates,
    this.image,
  );

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        geocoordinates,
        image,
      ];
}
