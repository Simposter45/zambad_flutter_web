import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/enums/main_page_enums.dart';
import '../../../core/utils/responsive.dart';
import '../../manage_categories/screens/manage_categories.dart';
import '../../manage_color/screens/manage_color.dart';
import '../../manage_gold_purity/screens/manage_gold_purity.dart';
import '../../manage_orders/screens/manage_orders.dart';
import '../../manage_orders/store/order_store.dart';
import '../../manage_pos/screens/manage_pos.dart';
import '../../manage_pos/store/pos_store.dart';
import '../../manage_products/screens/manage_products.dart';
import '../../manage_states/screens/manage_state.dart';
import '../../manage_user/screens/manage_users.dart';
import '../store/navigation_store.dart';
import '../widgets/side_bar.dart';
import 'views/dashboard.dart';
import 'views/dashboard_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationStore = context.read<NavigationStore>();

    return Observer(builder: (_) {
      Widget? currentView;

      switch (navigationStore.currentType) {
        case ScreenType.Dashboard:
          currentView =
              Responsive.isMobile(context) ? DashboardMobile() : Dashboard();
          break;

        case ScreenType.ManageProducts:
          currentView = ManageProducts();
          break;

        case ScreenType.ManageOrders:
          currentView = Material(
            child: MultiProvider(
              providers: [
                Provider<OrderStore>(
                  create: (_) => OrderStore(),
                ),
              ],
              child: ManageOrders(),
            ),
          );
          break;

        case ScreenType.ManagePOS:
          currentView = PosScreen();
          break;

        case ScreenType.ManageCategories:
          currentView = ManageCategories();
          break;

        case ScreenType.ManageStates:
          currentView = ManageState();
          break;

        case ScreenType.ManageUsers:
          currentView = ManageUsers();
          break;

        case ScreenType.ManageGoldPurity:
          currentView = ManageGoldPurity();
          break;

        case ScreenType.ManageColor:
          currentView = ManageColor();
          break;
      }

      if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
        return Scaffold(
          body: currentView,
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: const SideBar(),
            ),
            Expanded(
              child: currentView!,
            ),
          ],
        );
      }
    });
  }
}
