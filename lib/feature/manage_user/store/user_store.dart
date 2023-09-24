import 'package:mobx/mobx.dart';
import '../model/manage_user_model.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  _UserStore({required List<ManageUserModel> userList}) {
    this.userList.addAll(userList);
  }
  @observable
  ObservableList<ManageUserModel> userList = ObservableList<ManageUserModel>();

  @action
  void adduser(ManageUserModel user) {
    userList.add(user);
  }

  @action
  void edituser(ManageUserModel editeduser, ManageUserModel existinguser) {
    final index = userList.indexWhere((user) => user == existinguser);

    if (index != -1) {
      userList[index] = editeduser;
    }
  }

  @action
  void deleteuser(ManageUserModel userModel) {
    userList.remove(userModel);
  }
}
