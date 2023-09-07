import 'package:first_proj/feature/home/screens/views/dashboard.dart';
import 'package:first_proj/feature/home/screens/views/manage_categories.dart';
import 'package:first_proj/feature/home/screens/views/manage_orders.dart';
import 'package:first_proj/feature/home/screens/views/manage_pos.dart';
import 'package:first_proj/feature/home/screens/views/manage_products.dart';
import 'package:first_proj/feature/home/screens/views/manage_users.dart';
import 'package:first_proj/feature/home/store/navigation_store.dart';

import 'package:first_proj/feature/home/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final navigationStore = NavigationStore();

class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var views = [
      Dashboard(),
      ManageProducts(),
      ManageOrders(),
      ManagePos(),
      ManageCategories(),
      ManageUsers(),
    ];

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            alignment: Alignment.topCenter,
            child: const SideBar(),
          ),
          Expanded(
            child: Observer(
              builder: (context) {
                final index = navigationStore.currentIndex;
                if (index == 0) {
                  return views[1];
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
