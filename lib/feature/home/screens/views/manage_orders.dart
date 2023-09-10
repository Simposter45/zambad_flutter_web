import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../_global/widgets/action_button.dart';
import '../../../_global/widgets/appbar_widget.dart';
import '../../model/manage_orders_model.dart';

class ManageOrders extends StatelessWidget {
  ManageOrders({Key? key}) : super(key: key);
  final List<ManageOrderModel> orderList = getOrders();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Manage Orders',
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

class OrderCard extends StatefulWidget {
  const OrderCard({
    required this.orderItem,
    Key? key,
  }) : super(key: key);

  final ManageOrderModel orderItem;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        onHover: (val) {
          setState(() {
            isHovered = !isHovered;
          });
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
                    lastText: widget.orderItem.customerName,
                  ),
                  TextWidget(
                    isHovered: isHovered,
                    firstText: 'Contact Person : ',
                    lastText: widget.orderItem.contactPerson,
                  ),
                  TextWidget(
                    isHovered: isHovered,
                    firstText: 'Sales Person : ',
                    lastText: widget.orderItem.salesPerson,
                  ),
                  TextWidget(
                    isHovered: isHovered,
                    firstText: 'POS : ',
                    lastText: widget.orderItem.pos,
                  ),
                  TextWidget(
                    isHovered: isHovered,
                    firstText: 'Date : ',
                    lastText: widget.orderItem.date,
                  ),
                ]),
          ),
        ),
      ),
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
