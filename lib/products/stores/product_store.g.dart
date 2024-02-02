// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on ProductStoreBase, Store {
  late final _$itemsAtom =
      Atom(name: 'ProductStoreBase.items', context: context);

  @override
  ObservableList<Product> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Product> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$itemAtom = Atom(name: 'ProductStoreBase.item', context: context);

  @override
  Product get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(Product value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$isSelectedFetchingAtom =
      Atom(name: 'ProductStoreBase.isSelectedFetching', context: context);

  @override
  bool get isSelectedFetching {
    _$isSelectedFetchingAtom.reportRead();
    return super.isSelectedFetching;
  }

  @override
  set isSelectedFetching(bool value) {
    _$isSelectedFetchingAtom.reportWrite(value, super.isSelectedFetching, () {
      super.isSelectedFetching = value;
    });
  }

  late final _$isListFetchingAtom =
      Atom(name: 'ProductStoreBase.isListFetching', context: context);

  @override
  bool get isListFetching {
    _$isListFetchingAtom.reportRead();
    return super.isListFetching;
  }

  @override
  set isListFetching(bool value) {
    _$isListFetchingAtom.reportWrite(value, super.isListFetching, () {
      super.isListFetching = value;
    });
  }

  late final _$isCreatingAtom =
      Atom(name: 'ProductStoreBase.isCreating', context: context);

  @override
  bool get isCreating {
    _$isCreatingAtom.reportRead();
    return super.isCreating;
  }

  @override
  set isCreating(bool value) {
    _$isCreatingAtom.reportWrite(value, super.isCreating, () {
      super.isCreating = value;
    });
  }

  late final _$isUpdatingAtom =
      Atom(name: 'ProductStoreBase.isUpdating', context: context);

  @override
  bool get isUpdating {
    _$isUpdatingAtom.reportRead();
    return super.isUpdating;
  }

  @override
  set isUpdating(bool value) {
    _$isUpdatingAtom.reportWrite(value, super.isUpdating, () {
      super.isUpdating = value;
    });
  }

  late final _$isDeletingAtom =
      Atom(name: 'ProductStoreBase.isDeleting', context: context);

  @override
  bool get isDeleting {
    _$isDeletingAtom.reportRead();
    return super.isDeleting;
  }

  @override
  set isDeleting(bool value) {
    _$isDeletingAtom.reportWrite(value, super.isDeleting, () {
      super.isDeleting = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('ProductStoreBase.fetch', context: context);

  @override
  Future<bool> fetch(String productId) {
    return _$fetchAsyncAction.run(() => super.fetch(productId));
  }

  late final _$fetchListAsyncAction =
      AsyncAction('ProductStoreBase.fetchList', context: context);

  @override
  Future<bool> fetchList() {
    return _$fetchListAsyncAction.run(() => super.fetchList());
  }

  late final _$createAsyncAction =
      AsyncAction('ProductStoreBase.create', context: context);

  @override
  Future<bool> create(Map<String, dynamic> formValues) {
    return _$createAsyncAction.run(() => super.create(formValues));
  }

  late final _$updateAsyncAction =
      AsyncAction('ProductStoreBase.update', context: context);

  @override
  Future<bool> update(String id, Product formValues) {
    return _$updateAsyncAction.run(() => super.update(id, formValues));
  }

  late final _$deleteAsyncAction =
      AsyncAction('ProductStoreBase.delete', context: context);

  @override
  Future<bool> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$ProductStoreBaseActionController =
      ActionController(name: 'ProductStoreBase', context: context);

  @override
  void setList(List<Product> list) {
    final _$actionInfo = _$ProductStoreBaseActionController.startAction(
        name: 'ProductStoreBase.setList');
    try {
      return super.setList(list);
    } finally {
      _$ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelected(Product product) {
    final _$actionInfo = _$ProductStoreBaseActionController.startAction(
        name: 'ProductStoreBase.setSelected');
    try {
      return super.setSelected(product);
    } finally {
      _$ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic createItem(Product item) {
    final _$actionInfo = _$ProductStoreBaseActionController.startAction(
        name: 'ProductStoreBase.createItem');
    try {
      return super.createItem(item);
    } finally {
      _$ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateItem(String id, Product formValues) {
    final _$actionInfo = _$ProductStoreBaseActionController.startAction(
        name: 'ProductStoreBase.updateItem');
    try {
      return super.updateItem(id, formValues);
    } finally {
      _$ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteItem(String id) {
    final _$actionInfo = _$ProductStoreBaseActionController.startAction(
        name: 'ProductStoreBase.deleteItem');
    try {
      return super.deleteItem(id);
    } finally {
      _$ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
item: ${item},
isSelectedFetching: ${isSelectedFetching},
isListFetching: ${isListFetching},
isCreating: ${isCreating},
isUpdating: ${isUpdating},
isDeleting: ${isDeleting}
    ''';
  }
}
