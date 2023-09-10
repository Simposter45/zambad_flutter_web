import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../model/latest_customer_model.dart';
import '../widgets/header_widget.dart';
import '../widgets/side_bar.dart';
import 'views/manage_categories.dart';
import 'views/manage_orders.dart';
import 'views/manage_pos.dart';
import 'views/manage_products.dart';
import 'views/manage_users.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final views = [
      DashboardMobile(),
      ManageProducts(),
      ManageOrders(),
      ManagePos(),
      ManageCategories(),
      ManageUsers(),
    ];

    return Scaffold(body: Observer(
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

class DashboardMobile extends StatelessWidget {
  DashboardMobile({
    Key? key,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<LatestCustomerModel> orderList = getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeaderWidget(
                    text: 'Total Number of Orders',
                    amount: 0,
                    icon: Icons.bar_chart_rounded,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  const HeaderWidget(
                      text: 'Total No. of Products',
                      amount: 0,
                      icon: Icons.shopping_bag_outlined),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  const HeaderWidget(
                      text: 'Total No. of POS',
                      amount: 0,
                      icon: Icons.storefront_rounded)
                ],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Latest Orders',
                      style: AppTextStyles.sairaNormal.copyWith(fontSize: 20),
                    ),
                  ),
                  if (orderList.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        final order = orderList[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                  color: AppColors.grey5,
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.deepGold))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Order Id',
                                      style: AppTextStyles.sairaNormal,
                                    ),
                                    Text(
                                      'POS',
                                      style: AppTextStyles.sairaNormal,
                                    ),
                                    Text(
                                      'DATE',
                                      style: AppTextStyles.sairaNormal,
                                    ),
                                    Text(
                                      'Customer Name',
                                      style: AppTextStyles.sairaNormal,
                                    ),
                                    Text(
                                      'Action',
                                      style: AppTextStyles.sairaNormal,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    order.orderId,
                                    style: AppTextStyles.sairaGoldSmall,
                                  ),
                                  Text(
                                    order.pos,
                                  ),
                                  Text(
                                    order.date,
                                  ),
                                  Text(
                                    order.customerName,
                                  ),
                                  IconButton(
                                      splashRadius: 10,
                                      onPressed: () {},
                                      icon: const Icon(Icons.info, size: 20))
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                ],
              ),
            ),
            if (orderList.isEmpty)
              const Center(
                child: Text('No latest orders',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.sairaLightGrey),
              ),
          ],
        ),
      ),
    );
  }
}
