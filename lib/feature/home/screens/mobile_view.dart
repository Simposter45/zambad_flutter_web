import 'package:flutter/material.dart';

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

class MobileView extends StatelessWidget {
  MobileView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<LatestCustomerModel> orderList = getList();
    final views = [
      Dashboard(),
      ManageProducts(),
      ManageOrders(),
      ManagePos(),
      const ManageCategories(),
      const ManageUsers(),
    ];

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBarWidget(
          title: 'Dashboard',
          widget: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: [
            ActionButton(
              icon: Icons.refresh,
              action: () {},
            )
          ],
        ),
        drawer: const SideBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HeaderWidget(
                          text: 'Total Number of Orders',
                          amount: 0,
                          icon: Icons.bar_chart_rounded,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.05),
                        const HeaderWidget(
                            text: 'Total No. of Products',
                            amount: 0,
                            icon: Icons.shopping_bag_outlined),
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.05),
                        const HeaderWidget(
                            text: 'Total No. of POS',
                            amount: 0,
                            icon: Icons.storefront_rounded)
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  constraints: const BoxConstraints(
                    minWidth: 500,
                  ),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.deepGold),
                      borderRadius: BorderRadius.circular(7)),
                  child: const Text(
                    'Latest Orders',
                    style: AppTextStyles.nunitoSansBold,
                  ),
                ),
                if (orderList.isEmpty)
                  const Center(
                    child: Text('No latest orders',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.sairaLightGrey),
                  )
                else
                  const Center(
                    child: Text('List W'),
                  )
              ]),
            ],
          ),
        ));
  }
}
