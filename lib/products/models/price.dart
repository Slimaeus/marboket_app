import 'package:json_annotation/json_annotation.dart';
import 'package:marboket_app/products/models/item_unit.dart';
import 'package:marboket_app/products/models/product.dart';

part 'price.g.dart';

@JsonSerializable()
class Price {
  String? id;
  double? pricePerUnit;
  double? unitAmount;
  bool? isActive;
  Product? product;
  ItemUnit? itemUnit;

  Price(
      {this.id,
      this.pricePerUnit,
      this.unitAmount,
      this.isActive,
      this.product,
      this.itemUnit});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
