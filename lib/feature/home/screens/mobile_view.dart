import 'package:first_proj/core/constants/colors.dart';
import 'package:first_proj/core/constants/styles.dart';
import 'package:first_proj/feature/_global/widgets/action_button.dart';
import 'package:first_proj/feature/_global/widgets/appbar_widget.dart';
import 'package:first_proj/feature/home/model/latest_customer_model.dart';
import 'package:first_proj/feature/home/screens/views/dashboard.dart';
import 'package:first_proj/feature/home/screens/views/manage_categories.dart';
import 'package:first_proj/feature/home/screens/views/manage_orders.dart';
import 'package:first_proj/feature/home/screens/views/manage_pos.dart';
import 'package:first_proj/feature/home/screens/views/manage_products.dart';
import 'package:first_proj/feature/home/screens/views/manage_users.dart';
import 'package:first_proj/feature/home/widgets/header_widget.dart';
import 'package:first_proj/feature/home/widgets/side_bar.dart';
import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  MobileView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<LatestCustomerModel> orderList = getList();
    var views = [
      Dashboard(),
      ManageProducts(),
      ManageOrders(),
      ManagePos(),
      ManageCategories(),
      ManageUsers(),
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
                    scrollDirection: Axis.vertical,
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
                  Center(
                    child: Text('List W'),
                  )
              ]),
            ],
          ),
        ));
  }
}
