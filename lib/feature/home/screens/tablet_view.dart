import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/side_bar.dart';
import 'views/dashboard.dart';
import 'views/manage_categories.dart';
import 'views/manage_orders.dart';
import 'views/manage_pos.dart';
import 'views/manage_products.dart';
import 'views/manage_users.dart';

class TabletView extends StatelessWidget {
  TabletView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
        key: _scaffoldKey,
        body: Observer(
          builder: (context) {
            // print(navigationStore.currentIndex);
            final index = navigationStore.currentIndex;
            if (index == 0) {
              return views[5];
            } else {
              return views[1];
            }
          },
        ));
  }
}
