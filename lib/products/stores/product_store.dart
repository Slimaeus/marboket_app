import 'dart:io';

import 'package:marboket_app/app/models/paged_list.dart';
import 'package:marboket_app/app/services/api_service.dart';
import 'package:marboket_app/products/models/product.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = ProductStoreBase with _$ProductStore;

abstract class ProductStoreBase with Store {
  final ApiService _apiService =
      ApiService("https://marboket.azurewebsites.net/api/");

  @observable
  ObservableList<Product> items = ObservableList.of([]);

  @observable
  Product item = Product();

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
  void setList(List<Product> list) {
    list = ObservableList.of(list);
  }

  @action
  void setSelected(Product product) {
    item = product;
  }

  @action
  Future<bool> fetch(String productId) async {
    isSelectedFetching = true;
    var response =
        await _apiService.get<Product>('Products/$productId', (results) {
      return Product.fromJson(results);
    });
    if (response.isSucceed && response.data != null) {
      setSelected(response.data!);
      isSelectedFetching = false;
      return true;
    }
    isSelectedFetching = false;
    return false;
  }

  @action
  Future<bool> fetchList() async {
    isListFetching = true;
    var response = await _apiService.get<PagedList>('Products', (results) {
      PagedList pagedList = PagedList.fromJson(results);
      return pagedList;
    });
    if (response.isSucceed && response.data != null) {
      final list = response.data!.getItemList((json) => Product.fromJson(json));
      list.sort((a, b) => a.name!.compareTo(b.name!));
      items = ObservableList.of(list);
      isListFetching = false;
      return true;
    }
    isListFetching = false;
    return false;
  }

  @action
  createItem(Product item) {
    items.insert(0, item);
  }

  @action
  Future<bool> create(Map<String, dynamic> formValues) async {
    isCreating = true;
    var response = await _apiService.post<Product>('Products', (results) {
      return Product.fromJson(results);
    }, formValues);
    if (response.isSucceed && response.data != null) {
      item = response.data!;
      createItem(response.data!);
      isCreating = false;
      return true;
    }
    isCreating = false;
    return false;
  }

  @action
  updateItem(String id, Product formValues) {
    if (item.id != null && item.id!.isNotEmpty) {
      if (id == item.id) {
        item = item.update(formValues);
      }
    }
    int index = items.indexWhere((e) => e.id == id);
    if (index != -1) {
      items[index].update(formValues);
      items = ObservableList.of(items);
    }
  }

  @action
  Future<bool> update(String id, Product formValues) async {
    isUpdating = true;
    var response = await _apiService.put<Product>('Products/$id', (results) {
      return Product.fromJson(results);
    }, formValues);
    final current = Map.from(item.toJson());
    updateItem(id, formValues);
    if (response.isSucceed && response.data != null) {
      isUpdating = false;
      return true;
    }
    updateItem(id, Product.fromJson(current as Map<String, dynamic>));
    isUpdating = false;
    return false;
  }

  @action
  deleteItem(String id) {
    int itemIndex = items.indexWhere((item) => item.id == id);
    items.removeAt(itemIndex);
  }

  @action
  Future<bool> delete(String id) async {
    isDeleting = true;
    var response = await _apiService.delete<Product>('Products/$id', (results) {
      return Product.fromJson(results);
    });
    if (response.isSucceed && response.data != null) {
      deleteItem(id);
      isDeleting = false;
      return true;
    }
    isDeleting = false;
    return false;
  }

  @action
  Future<bool> addPrice(
      String productId, Map<String, dynamic> formValues) async {
    isUpdating = true;
    var response = await _apiService.post<Product>('Products/$productId/Prices',
        (results) {
      return Product.fromJson(results);
    }, formValues);
    final current = Map.from(item.toJson());
    updateItem(productId, response.data!);
    if (response.isSucceed && response.data != null) {
      isUpdating = false;
      return true;
    }
    updateItem(productId, Product.fromJson(current as Map<String, dynamic>));
    isUpdating = false;
    return false;
  }

  @action
  Future<bool> removePrice(String productId, String priceId) async {
    isUpdating = true;
    var response = await _apiService
        .delete<Product>('Products/$productId/Prices/$priceId', (results) {
      return Product.fromJson(results);
    });
    final current = Map.from(item.toJson());
    updateItem(productId, response.data!);
    if (response.isSucceed && response.data != null) {
      isUpdating = false;
      return true;
    }
    updateItem(productId, Product.fromJson(current as Map<String, dynamic>));
    isUpdating = false;
    return false;
  }

  @action
  Future<bool> addPhoto(String productId, File file) async {
    isUpdating = true;
    var response = await _apiService.uploadFile<Product>(
        'Products/$productId/Photos', {}, 'file', file.path, file, (results) {
      return Product.fromJson(results);
    });
    final current = Map.from(item.toJson());
    updateItem(productId, response.data!);
    if (response.isSucceed && response.data != null) {
      isUpdating = false;
      return true;
    }
    updateItem(productId, Product.fromJson(current as Map<String, dynamic>));
    isUpdating = false;
    return false;
  }

  @action
  Future<bool> removePhoto(String productId, String photoId) async {
    isUpdating = true;
    var encodedPhotoId = Uri.encodeComponent(photoId);
    var response =
        await _apiService.delete<Product>('Photos/$encodedPhotoId', (results) {
      return Product.fromJson(results);
    });
    final current = Map.from(item.toJson());
    updateItem(productId, response.data!);
    if (response.isSucceed && response.data != null) {
      isUpdating = false;
      return true;
    }
    updateItem(productId, Product.fromJson(current as Map<String, dynamic>));
    isUpdating = false;
    return false;
  }
}
