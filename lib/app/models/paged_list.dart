import 'package:json_annotation/json_annotation.dart';

part 'paged_list.g.dart';

@JsonSerializable()
class PagedList {
  int? pageIndex;
  int? pageSize;
  int? count;
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  dynamic items;

  PagedList(
      {this.pageIndex,
      this.pageSize,
      this.count,
      this.totalCount,
      this.totalPages,
      this.hasPreviousPage,
      this.hasNextPage,
      this.items});

  factory PagedList.fromJson(Map<String, dynamic> json) =>
      _$PagedListFromJson(json);

  Map<String, dynamic> toJson() => _$PagedListToJson(this);

  List<TItem> getItemList<TItem>(TItem Function(dynamic json) fromJson) {
    return (items as List).map((item) => fromJson(item)).toList();
  }
}
