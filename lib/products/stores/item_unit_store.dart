import 'package:marboket_app/app/models/paged_list.dart';
import 'package:marboket_app/app/services/api_service.dart';
import 'package:marboket_app/products/models/item_unit.dart';
import 'package:mobx/mobx.dart';

part 'item_unit_store.g.dart';

class ItemUnitStore = ItemUnitStoreBase with _$ItemUnitStore;

abstract class ItemUnitStoreBase with Store {
  final ApiService _apiService =
      ApiService("https://marboket.azurewebsites.net/api/");

  @observable
  ObservableList<ItemUnit> list = ObservableList.of([]);

  @observable
  ItemUnit? selected;

  @observable
  bool isSelectedFetching = false;

  @observable
  bool isListFetching = false;

  @observable
  bool isCreating = false;

  @observable
  bool isUpdating = false;

  @observable
  bool isDeleting = false;

  @action
  void setList(List<ItemUnit> list) {
    list = ObservableList.of(list);
  }

  @action
  void setSelected(ItemUnit itemUnit) {
    selected = itemUnit;
  }

  @action
  Future<bool> fetchList() async {
    isListFetching = true;
    var response = await _apiService.get<PagedList>('Units', (results) {
      PagedList pagedList = PagedList.fromJson(results);
      return pagedList;
    });
    if (response.isSucceed && response.data != null) {
      list = ObservableList.of(
          response.data!.getItemList((json) => ItemUnit.fromJson(json)));
      isListFetching = false;
      return true;
    }
    isListFetching = false;
    return false;
  }
}
