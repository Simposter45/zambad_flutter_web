// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on _NavigationStore, Store {
  late final _$currentIndexAtom =
      Atom(name: '_NavigationStore.currentIndex', context: context);

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

  late final _$hoveredIndexAtom =
      Atom(name: '_NavigationStore.hoveredIndex', context: context);

  @override
  int get hoveredIndex {
    _$hoveredIndexAtom.reportRead();
    return super.hoveredIndex;
  }

  @override
  set hoveredIndex(int value) {
    _$hoveredIndexAtom.reportWrite(value, super.hoveredIndex, () {
      super.hoveredIndex = value;
    });
  }

  late final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore', context: context);

  @override
  void setCurrentIndex(int index) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHoveredIndex(int index) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setHoveredIndex');
    try {
      return super.setHoveredIndex(index);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
hoveredIndex: ${hoveredIndex}
    ''';
  }
}
