// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedList _$PagedListFromJson(Map<String, dynamic> json) => PagedList(
      pageIndex: json['pageIndex'] as int?,
      pageSize: json['pageSize'] as int?,
      count: json['count'] as int?,
      totalCount: json['totalCount'] as int?,
      totalPages: json['totalPages'] as int?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      items: json['items'],
    );

Map<String, dynamic> _$PagedListToJson(PagedList instance) => <String, dynamic>{
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'count': instance.count,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
      'items': instance.items,
    };
