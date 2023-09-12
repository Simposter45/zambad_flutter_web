import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final navigationStore = NavigationStore();

  @override
  Widget build(BuildContext context) {
    final views = [
      Responsive.isMobile(context) ? DashboardMobile() : Dashboard(),
      ManageProducts(),
      ManageOrders(),
      ManagePos(),
      ManageCategories(),
      ManageUsers(),
    ];

    if (Responsive.isMobile(context)) {
      return Scaffold(
        body: Observer(
          builder: (context) {
            // print(navigationStore.currentIndex);
            final index = navigationStore.currentIndex;
            if (index == 0) {
              return views[0];
            } else {
              return views[1];
            }
          },
        ),
      );
    } else if (Responsive.isTablet(context)) {
      return Scaffold(
        body: Observer(
          builder: (context) {
            // print(navigationStore.currentIndex);
            final index = navigationStore.currentIndex;
            if (index == 0) {
              return views[0];
            } else {
              return views[1];
            }
          },
        ),
      );
    } else {
      return Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: const SideBar(),
            ),
            Expanded(
              child: Observer(
                builder: (context) {
                  // print(navigationStore.currentIndex);
                  final index = navigationStore.currentIndex;
                  if (index == 0) {
                    return views[0];
                  } else {
                    return views[1];
                  }
                },
              ),
            )
          ],
        ),
      );
    }
  }
}
