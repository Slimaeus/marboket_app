// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      id: json['id'] as String?,
      pricePerUnit: (json['pricePerUnit'] as num?)?.toDouble(),
      unitAmount: (json['unitAmount'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      itemUnit: json['itemUnit'] == null
          ? null
          : ItemUnit.fromJson(json['itemUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'id': instance.id,
      'pricePerUnit': instance.pricePerUnit,
      'unitAmount': instance.unitAmount,
      'isActive': instance.isActive,
      'product': instance.product,
      'itemUnit': instance.itemUnit,
    };
