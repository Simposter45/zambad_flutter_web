import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  int currentIndex = 0;

  @observable
  int hoveredIndex = 0;

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }

  @action
  void setHoveredIndex(int index) {
    hoveredIndex = index;
  }
}
