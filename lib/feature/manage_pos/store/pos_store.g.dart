// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PosStore on _PosStore, Store {
  late final _$posListAtom = Atom(name: '_PosStore.posList', context: context);

  @override
  ObservableList<ManagePosModel> get posList {
    _$posListAtom.reportRead();
    return super.posList;
  }

  @override
  set posList(ObservableList<ManagePosModel> value) {
    _$posListAtom.reportWrite(value, super.posList, () {
      super.posList = value;
    });
  }

  late final _$_PosStoreActionController =
      ActionController(name: '_PosStore', context: context);

  @override
  void addPos(ManagePosModel pos) {
    final _$actionInfo =
        _$_PosStoreActionController.startAction(name: '_PosStore.addPos');
    try {
      return super.addPos(pos);
    } finally {
      _$_PosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editPos(ManagePosModel editedPos, ManagePosModel existingPos) {
    final _$actionInfo =
        _$_PosStoreActionController.startAction(name: '_PosStore.editPos');
    try {
      return super.editPos(editedPos, existingPos);
    } finally {
      _$_PosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deletePos(ManagePosModel posModel) {
    final _$actionInfo =
        _$_PosStoreActionController.startAction(name: '_PosStore.deletePos');
    try {
      return super.deletePos(posModel);
    } finally {
      _$_PosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posList: ${posList}
    ''';
  }
}
