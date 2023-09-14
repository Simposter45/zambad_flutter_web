import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final List<LatestCustomerModel> orderList = getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: Responsive.isTablet(context) || Responsive.isMobile(context)
            ? AppBarWidget(
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
                    title: 'Refresh',
                    action: () {},
                  )
                ],
              )
            : null,
        drawer: Responsive.isTablet(context) || Responsive.isMobile(context)
            ? const SideBar()
            : null,
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
                appBar: AppBarWidget(
                  title: 'Order Details',
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
                body: Container(
                  height: 54,
                  decoration: const BoxDecoration(color: AppColors.grey5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Order Id',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                      Text(
                        'POS',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                      Text(
                        'DATE',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                      Text(
                        'Customer Name',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                      Text(
                        'Action',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
