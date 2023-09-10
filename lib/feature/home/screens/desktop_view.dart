import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../store/navigation_store.dart';
import '../widgets/side_bar.dart';
import 'views/dashboard.dart';
import 'views/manage_categories.dart';
import 'views/manage_orders.dart';
import 'views/manage_pos.dart';
import 'views/manage_products.dart';
import 'views/manage_users.dart';

final navigationStore = NavigationStore();

class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final views = [
      Dashboard(),
      ManageProducts(),
      ManageOrders(),
      ManagePos(),
      ManageCategories(),
      ManageUsers(),
    ];

    return MultiProvider(
      providers: [Provider(create: (_) => NavigationStore())],
      child: Scaffold(
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
                  // print(navigationStore.currentIndex);
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
      ),
    );
  }
}
