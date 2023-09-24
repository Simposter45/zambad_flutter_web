import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../model/order_details_model.dart';
import 'order_details_widget.dart';
import 'your_products.dart';

class YourOrders extends StatelessWidget {
  const YourOrders({
    required this.model,
    Key? key,
  }) : super(key: key);
  final OrderDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.only(left: 34),
            child: Text(
              model.customerName,
              style: AppTextStyles.nunitoSansNormal.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 34),
            child: Row(
              children: [
                const Icon(
                  Icons.email,
                  size: 13,
                  color: AppColors.deepGold,
                ),
                const SizedBox(width: 6),
                Text(
                  model.customerEmail.trim().isEmpty
                      ? "-"
                      : model.customerEmail.trim(),
                  style: AppTextStyles.nunitoNormal,
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          OrderDetailsWidget(1,
              orderDetailType: "Contact Person:",
              orderDetail: model.contactPerson),
          const SizedBox(height: 12),
          OrderDetailsWidget(1,
              orderDetailType: "Sales Person:",
              orderDetail: model.salesPersonName),
          const SizedBox(height: 12),
          OrderDetailsWidget(1,
              orderDetailType: "Phone Number:", orderDetail: model.phoneNumber),
          const SizedBox(height: 12),
          OrderDetailsWidget(
            2,
            orderDetailType: "Address:",
            orderDetail:
                model.address!.trim().isEmpty ? "-" : model.address!.trim(),
          ),
          const SizedBox(height: 14),
          OrderDetailsWidget(
            2,
            orderDetailType: "Notes:",
            orderDetail:
                model.notes!.trim().isEmpty ? "-" : model.notes!.trim(),
          ),
          const SizedBox(height: 16),
          OrderDetailsWidget(
            4,
            orderDetailType: "POS:",
            orderDetail: model.pos.trim().isEmpty ? "-" : model.pos.trim(),
          ),
          const SizedBox(height: 16),
          OrderDetailsWidget(
            1,
            orderDetailType: "State:",
            orderDetail: model.state[0].state,
          ),
          const SizedBox(height: 16),
          OrderDetailsWidget(
            1,
            orderDetailType: "City:",
            orderDetail: model.city,
          ),
          const SizedBox(height: 16),
          OrderDetailsWidget(
            1,
            orderDetailType: "Order Date:",
            orderDetail: model.createdAt.toString().substring(0, 11),
          ),
          const SizedBox(height: 16),
          OrderDetailsWidget(
            1,
            orderDetailType: "Last Updated At:",
            orderDetail: model.updatedAt.toString().substring(0, 11),
          ),
          if (model.extraImages.isNotEmpty) ...[
            const SizedBox(height: 15),
            OrderDetailsWidget(
              1,
              orderDetailType: "Images:",
              orderDetail: "",
              images: model.extraImages,
            ),
          ],
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Your products',
              style: AppTextStyles.nunitoSansNormal.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (model.products.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.all(30),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderGrey)),
                child: Responsive.isMobile(context)
                    ? YourProductsMobile(model: model)
                    : YourProducts(model: model),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
