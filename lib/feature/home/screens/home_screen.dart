import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/responsive.dart';
import '../../manage_categories/screens/manage_categories.dart';
import '../../manage_orders/screens/manage_orders.dart';
import '../../manage_pos/screens/manage_pos.dart';
import '../../manage_products/screens/manage_products.dart';
import '../../manage_user/screens/manage_users.dart';
import '../store/navigation_store.dart';
import '../widgets/side_bar.dart';
import 'views/dashboard.dart';
import 'views/dashboard_mobile.dart';

final navigationStore = NavigationStore();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationStore = context.read<NavigationStore>();
    final views = [
      Responsive.isMobile(context) ? DashboardMobile() : Dashboard(),
      ManageProducts(),
      ManageOrders(),
      ManagePos(),
      ManageCategories(),
      ManageUsers(),
    ];

    if (Responsive.isMobile(context)) {
      return Observer(builder: (_) {
        return Scaffold(
          body: views[navigationStore.currentIndex],
        );
      });
    } else if (Responsive.isTablet(context)) {
      return Observer(builder: (_) {
        return Scaffold(
          body: views[navigationStore.currentIndex],
        );
      });
    } else {
      return Observer(builder: (_) {
        return Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: const SideBar(),
              ),
              Expanded(
                child: views[navigationStore.currentIndex],
              )
            ],
          ),
        );
      });
    }
  }
}
