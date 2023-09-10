import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../model/latest_customer_model.dart';
import '../widgets/header_widget.dart';
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
    final List<LatestCustomerModel> orderList = getList();
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
              return views[1];
            } else {
              return views[1];
            }
          },
        ));
  }
}
