import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../model/manage_orders_model.dart';
import '../store/order_store.dart';

class ManageOrders extends StatelessWidget {
  ManageOrders({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<ManageOrderModel> orderList = getOrders();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(
        title: 'Manage Orders',
        widget: Responsive.isTablet(context) || Responsive.isMobile(context)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              )
            : const SizedBox(),
        actions: [
          ActionButton(
            title: 'Generate Excel',
            action: () {},
          ),
          ActionButton(
            icon: Icons.add,
            title: ' Add Product',
            action: () {},
          ),
        ],
      ),
      drawer: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? const SideBar()
          : null,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: SearchBar(
                controller: textController,
                leading: const Icon(Icons.search, size: 16),
                hintText: 'Search by any Products name',
                hintStyle: MaterialStatePropertyAll(
                  AppTextStyles.sairaLightGrey.copyWith(fontSize: 14),
                ),
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor:
                    const MaterialStatePropertyAll(AppColors.grey6),
                shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                  itemCount: orderList.length,
                  itemBuilder: (context, index) {
                    final orderItem = orderList[index];
                    return InkWell(
                        onHover: (value) {},
                        child: OrderCard(orderItem: orderItem));
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  OrderCard({
    required this.orderItem,
    Key? key,
  }) : super(key: key);

  final ManageOrderModel orderItem;

  bool isHovered = false;
  final store = OrderStore(isHovered: false);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final isHovered = store.isHovered;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: () {},
            onHover: store.setHoveredIndex,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: isHovered ? AppColors.deepGold : null,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: AppColors.borderGrey,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        isHovered: isHovered,
                        firstText: 'Customer Name : ',
                        lastText: orderItem.customerName,
                      ),
                      TextWidget(
                        isHovered: isHovered,
                        firstText: 'Contact Person : ',
                        lastText: orderItem.contactPerson,
                      ),
                      TextWidget(
                        isHovered: isHovered,
                        firstText: 'Sales Person : ',
                        lastText: orderItem.salesPerson,
                      ),
                      TextWidget(
                        isHovered: isHovered,
                        firstText: 'POS : ',
                        lastText: orderItem.pos,
                      ),
                      TextWidget(
                        isHovered: isHovered,
                        firstText: 'Date : ',
                        lastText: orderItem.date,
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.isHovered,
    required this.firstText,
    required this.lastText,
    Key? key,
  }) : super(key: key);

  final bool isHovered;
  final String firstText;
  final String lastText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: firstText,
          style: AppTextStyles.nunitoSansBold.copyWith(
            color: isHovered ? Colors.white : Colors.black,
          ),
          children: [
            TextSpan(
              text: lastText,
              style: AppTextStyles.nunitoSansNormal.copyWith(
                color: isHovered ? Colors.white : Colors.black,
              ),
            )
          ]),
    );
  }
}
