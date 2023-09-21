import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  @observable
  Map<String, bool> orderHoverStates = {};

  @action
  void setOrderHoverState(String orderId, bool isHovered) {
    orderHoverStates[orderId] = isHovered;
  }
}
