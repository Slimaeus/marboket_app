import 'package:json_annotation/json_annotation.dart';
import 'package:marboket_app/products/models/photo.dart';
import 'package:marboket_app/products/models/price.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String? id;
  String? name;
  String? description;
  String? friendlyUrlName;
  List<Price> prices = [];
  List<Photo> photos = [];

  Product(
      {this.id,
      this.name,
      this.description,
      this.friendlyUrlName,
      this.prices = const [],
      this.photos = const []});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  void update(Product product) {
    id = product.id ?? id;
    name = product.name ?? name;
    description = product.description ?? description;
    friendlyUrlName = product.friendlyUrlName ?? friendlyUrlName;
  }
}
