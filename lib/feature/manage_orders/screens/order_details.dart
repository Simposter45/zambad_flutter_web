import 'package:flutter/material.dart';

import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../model/order_details_model.dart';
import '../widgets/your_orders.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({required this.orderDetailsModel, Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  OrderDetailsModel orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDesktop(context))
          Container(
            alignment: Alignment.topCenter,
            child: const SideBar(),
          ),
        Expanded(
          child: Scaffold(
              key: _scaffoldKey,
              drawer:
                  Responsive.isTablet(context) || Responsive.isMobile(context)
                      ? const SideBar()
                      : null,
              appBar: AppBarWidget(
                title: 'Order Details',
                widget:
                    Responsive.isTablet(context) || Responsive.isMobile(context)
                        ? Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.menu),
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          )
                        : null,
                actions: [
                  ActionButton(
                    // icon: Icons.refresh,
                    title: 'Edit Order',
                    action: () {},
                  ),
                  ActionButton(
                    // icon: Icons.refresh,
                    title: 'Download PDF',
                    action: () {},
                  ),
                ],
              ),
              body: YourOrders(model: orderDetailsModel)),
        )
      ],
    ));
  }
}
