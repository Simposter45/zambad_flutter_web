import 'package:mobx/mobx.dart';
import '../../../core/enums/main_page_enums.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  ScreenType? currentType = ScreenType.Dashboard;

  @observable
  ScreenType? hoveredType;

  @action
  void setCurrentType(ScreenType type) {
    currentType = type;
  }

  @action
  void setHoveredType(ScreenType? type) {
    hoveredType = type;
  }
}
