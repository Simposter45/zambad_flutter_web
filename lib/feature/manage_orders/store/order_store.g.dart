// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStore on _OrderStore, Store {
  late final _$currentIndexAtom =
      Atom(name: '_OrderStore.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$isHoveredAtom =
      Atom(name: '_OrderStore.isHovered', context: context);

  @override
  bool get isHovered {
    _$isHoveredAtom.reportRead();
    return super.isHovered;
  }

  @override
  set isHovered(bool value) {
    _$isHoveredAtom.reportWrite(value, super.isHovered, () {
      super.isHovered = value;
    });
  }

  late final _$_OrderStoreActionController =
      ActionController(name: '_OrderStore', context: context);

  @override
  void setCurrentIndex(int index) {
    final _$actionInfo = _$_OrderStoreActionController.startAction(
        name: '_OrderStore.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_OrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHoveredIndex(bool hovered) {
    final _$actionInfo = _$_OrderStoreActionController.startAction(
        name: '_OrderStore.setHoveredIndex');
    try {
      return super.setHoveredIndex(hovered);
    } finally {
      _$_OrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
isHovered: ${isHovered}
    ''';
  }
}
