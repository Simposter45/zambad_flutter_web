import 'package:mobx/mobx.dart';
import '../model/manage_pos_model.dart';

part 'pos_store.g.dart';

class PosStore = _PosStore with _$PosStore;

abstract class _PosStore with Store {
  _PosStore() {
    posList.addAll(getPos());
  }
  @observable
  ObservableList<ManagePosModel> posList = ObservableList<ManagePosModel>();

  @action
  void addPos(ManagePosModel pos) {
    posList.add(pos);
  }
}
