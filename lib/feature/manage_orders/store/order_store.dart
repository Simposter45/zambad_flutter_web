import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  _OrderStore({required this.isHovered});
  @observable
  int currentIndex = 0;

  @observable
  bool isHovered = false;

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }

  @action
  void setHoveredIndex(bool hovered) {
    isHovered = hovered;
  }
}
