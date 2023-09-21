// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on _NavigationStore, Store {
  late final _$currentTypeAtom =
      Atom(name: '_NavigationStore.currentType', context: context);

  @override
  ScreenType? get currentType {
    _$currentTypeAtom.reportRead();
    return super.currentType;
  }

  @override
  set currentType(ScreenType? value) {
    _$currentTypeAtom.reportWrite(value, super.currentType, () {
      super.currentType = value;
    });
  }

  late final _$hoveredTypeAtom =
      Atom(name: '_NavigationStore.hoveredType', context: context);

  @override
  ScreenType? get hoveredType {
    _$hoveredTypeAtom.reportRead();
    return super.hoveredType;
  }

  @override
  set hoveredType(ScreenType? value) {
    _$hoveredTypeAtom.reportWrite(value, super.hoveredType, () {
      super.hoveredType = value;
    });
  }

  late final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore', context: context);

  @override
  void setCurrentType(ScreenType type) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setCurrentType');
    try {
      return super.setCurrentType(type);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHoveredType(ScreenType? type) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setHoveredType');
    try {
      return super.setHoveredType(type);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentType: ${currentType},
hoveredType: ${hoveredType}
    ''';
  }
}
