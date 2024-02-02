import 'package:json_annotation/json_annotation.dart';

part 'item_unit.g.dart';

@JsonSerializable()
class ItemUnit {
  int? id;
  String? name;
  String? alias;

  ItemUnit({this.id, this.name, this.alias});

  factory ItemUnit.fromJson(Map<String, dynamic> json) =>
      _$ItemUnitFromJson(json);

  Map<String, dynamic> toJson() => _$ItemUnitToJson(this);
}
