import 'package:mobx/mobx.dart';
import '../model/manage_pos_model.dart';
import '../screens/manage_pos.dart';

part 'pos_store.g.dart';

class PosStore = _PosStore with _$PosStore;

abstract class _PosStore with Store {
  _PosStore({required List<ManagePosModel> posList}) {
    this.posList.addAll(posList);
  }
  @observable
  ObservableList<ManagePosModel> posList = ObservableList<ManagePosModel>();

  @action
  void addPos(ManagePosModel pos) {
    posList.add(pos);
  }

  @action
  void editPos(ManagePosModel editedPos, ManagePosModel existingPos) {
    final index = posList.indexWhere((pos) => pos == existingPos);

    if (index != -1) {
      posList[index] = editedPos;
    }
  }

  @action
  void deletePos(ManagePosModel posModel) {
    posList.remove(posModel);
  }
}
