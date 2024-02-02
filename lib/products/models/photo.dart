import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  String? id;
  String? url;

  Photo({this.id, this.url});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
