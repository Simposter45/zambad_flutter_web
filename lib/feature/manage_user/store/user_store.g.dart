// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$userListAtom =
      Atom(name: '_UserStore.userList', context: context);

  @override
  ObservableList<ManageUserModel> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableList<ManageUserModel> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void adduser(ManageUserModel user) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.adduser');
    try {
      return super.adduser(user);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void edituser(ManageUserModel editeduser, ManageUserModel existinguser) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.edituser');
    try {
      return super.edituser(editeduser, existinguser);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteuser(ManageUserModel userModel) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.deleteuser');
    try {
      return super.deleteuser(userModel);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userList: ${userList}
    ''';
  }
}
