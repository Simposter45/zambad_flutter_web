import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../_global/widgets/action_button.dart';
import '../../../_global/widgets/appbar_widget.dart';
import '../../../manage_orders/model/order_details_model.dart';
import '../../../manage_orders/screens/order_details.dart';
import '../../../manage_pos/model/manage_pos_model.dart';
import '../../../manage_products/models/manage_product_model.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/side_bar.dart';

class DashboardMobile extends StatelessWidget {
  DashboardMobile({
    Key? key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<OrderDetailsModel> orders = orderList;

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  HeaderWidget(
                    text: 'Total Number of Orders',
                    amount: orderList.length,
                    icon: Icons.bar_chart_rounded,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  HeaderWidget(
                      text: 'Total No. of Products',
                      amount: productsList.length,
                      icon: Icons.shopping_bag_outlined),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  HeaderWidget(
                      text: 'Total No. of POS',
                      amount: posList.length,
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
                  if (orders.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
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
                                    order.createdAt.toString(),
                                  ),
                                  Text(
                                    order.customerName,
                                  ),
                                  IconButton(
                                      splashRadius: 10,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderDetails(
                                                      orderDetailsModel: order,
                                                    )));
                                      },
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
            if (orders.isEmpty)
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
