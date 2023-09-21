import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helper/text_widget.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../model/order_details_model.dart';
import '../store/order_store.dart';
import 'order_details.dart';

class ManageOrders extends StatefulWidget {
  const ManageOrders({Key? key}) : super(key: key);

  @override
  State<ManageOrders> createState() => _ManageOrdersState();
}

class _ManageOrdersState extends State<ManageOrders> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // final List<ManageOrderModel> orderList = getOrders();
  final List<OrderDetailsModel> orders = getOrderDetails();

  final textController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.read<OrderStore>();
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
            title: ' Add Orders',
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
                hintText: 'Search by any Orders name',
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
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final orderItem = orders[index];
                    return InkWell(
                        onHover: (value) {},
                        child: OrderCard(orderItem: orderItem, store: store));
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
    required this.store,
    Key? key,
  }) : super(key: key);

  final OrderDetailsModel orderItem;
  final OrderStore store;

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final isHovered = store.orderHoverStates[orderItem.orderId] ?? false;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderDetails(
                            orderDetailsModel: orderItem,
                          )));
            },
            onHover: (hover) {
              store.setOrderHoverState(orderItem.orderId, hover);
            },
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
                        lastText: orderItem.salesPersonName,
                      ),
                      TextWidget(
                        isHovered: isHovered,
                        firstText: 'POS : ',
                        lastText: orderItem.pos,
                      ),
                      TextWidget(
                        isHovered: isHovered,
                        firstText: 'Date : ',
                        lastText: orderItem.createdAt.toString(),
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
