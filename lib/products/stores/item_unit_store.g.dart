// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_unit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemUnitStore on ItemUnitStoreBase, Store {
  late final _$listAtom =
      Atom(name: 'ItemUnitStoreBase.list', context: context);

  @override
  ObservableList<ItemUnit> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<ItemUnit> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: 'ItemUnitStoreBase.selected', context: context);

  @override
  ItemUnit? get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(ItemUnit? value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$isSelectedFetchingAtom =
      Atom(name: 'ItemUnitStoreBase.isSelectedFetching', context: context);

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
      Atom(name: 'ItemUnitStoreBase.isListFetching', context: context);

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
      Atom(name: 'ItemUnitStoreBase.isCreating', context: context);

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
      Atom(name: 'ItemUnitStoreBase.isUpdating', context: context);

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
      Atom(name: 'ItemUnitStoreBase.isDeleting', context: context);

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

  late final _$fetchListAsyncAction =
      AsyncAction('ItemUnitStoreBase.fetchList', context: context);

  @override
  Future<bool> fetchList() {
    return _$fetchListAsyncAction.run(() => super.fetchList());
  }

  late final _$ItemUnitStoreBaseActionController =
      ActionController(name: 'ItemUnitStoreBase', context: context);

  @override
  void setList(List<ItemUnit> list) {
    final _$actionInfo = _$ItemUnitStoreBaseActionController.startAction(
        name: 'ItemUnitStoreBase.setList');
    try {
      return super.setList(list);
    } finally {
      _$ItemUnitStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelected(ItemUnit itemUnit) {
    final _$actionInfo = _$ItemUnitStoreBaseActionController.startAction(
        name: 'ItemUnitStoreBase.setSelected');
    try {
      return super.setSelected(itemUnit);
    } finally {
      _$ItemUnitStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
selected: ${selected},
isSelectedFetching: ${isSelectedFetching},
isListFetching: ${isListFetching},
isCreating: ${isCreating},
isUpdating: ${isUpdating},
isDeleting: ${isDeleting}
    ''';
  }
}
