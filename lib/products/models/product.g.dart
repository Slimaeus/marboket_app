// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      friendlyUrlName: json['friendlyUrlName'] as String?,
      prices: (json['prices'] as List<dynamic>?)
              ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'friendlyUrlName': instance.friendlyUrlName,
      'prices': instance.prices,
      'photos': instance.photos,
    };
