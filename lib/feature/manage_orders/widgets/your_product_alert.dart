import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../manage_products/models/manage_product_model.dart';
import '../model/order_details_model.dart';
import 'order_details_widget.dart';

class YourProductAlert extends StatelessWidget {
  const YourProductAlert({
    required this.productModel,
    required this.model,
    Key? key,
  }) : super(key: key);

  final ManageProductModel productModel;
  final OrderDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        icon: Align(
          alignment: Alignment.topRight,
          child: IconButton(
              splashRadius: 10,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
        ),
        actions: [
          if (Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_left_rounded)),
                      const SizedBox(width: 20),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.deepGold)),
                        child: Image.asset(
                          productModel.image,
                          height: 300,
                          width: 300,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_right_rounded)),
                    ],
                  ),
                  Image.asset(productModel.image),
                  OrderDetailsWidget(1,
                      orderDetailType: productModel.title.substring(0, 10),
                      orderDetail: ''),
                  OrderDetailsWidget(1,
                      orderDetailType: productModel.desc.substring(0, 10),
                      orderDetail: ''),
                  OrderDetailsWidget(1,
                      orderDetailType: "Category",
                      orderDetail: productModel.category),
                  const SizedBox(height: 12),
                  const OrderDetailsWidget(1,
                      orderDetailType: "SubCategory",
                      orderDetail: 'subcategory'),
                  const SizedBox(height: 12),
                  OrderDetailsWidget(1,
                      orderDetailType: "Gross Wieght",
                      orderDetail: productModel.grossWeight),
                  const SizedBox(height: 12),
                  OrderDetailsWidget(
                    1,
                    orderDetailType: "Net Weight",
                    orderDetail: productModel.netWeight,
                  ),
                  const SizedBox(height: 12),
                  OrderDetailsWidget(
                    1,
                    orderDetailType: "Gold Purity",
                    orderDetail: model.goldpurity[0].goldPurity,
                  ),
                  const SizedBox(height: 12),
                  OrderDetailsWidget(
                    1,
                    orderDetailType: "Color",
                    orderDetail: model.color[0].color,
                  ),
                  const SizedBox(height: 12),
                  OrderDetailsWidget(
                    1,
                    orderDetailType: "Something",
                    orderDetail:
                        model.pos.trim().isEmpty ? "-" : model.pos.trim(),
                  ),
                  const SizedBox(height: 12),
                  const OrderDetailsWidget(
                    1,
                    orderDetailType: "Quantity:",
                    orderDetail: '1',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_left_rounded)),
                  const SizedBox(width: 20),
                  Column(children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.deepGold)),
                      child: Image.asset(
                        productModel.image,
                        height: 300,
                        width: 300,
                      ),
                    ),
                    Image.asset(productModel.image),
                  ]),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderDetailsWidget(1,
                            orderDetailType:
                                productModel.title.substring(0, 10),
                            orderDetail: ''),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34),
                          child: Text(
                            productModel.desc.substring(0, 10),
                            style: AppTextStyles.nunitoNormal,
                          ),
                        ),
                        OrderDetailsWidget(1,
                            orderDetailType: "Category",
                            orderDetail: productModel.category),
                        const SizedBox(height: 12),
                        OrderDetailsWidget(1,
                            orderDetailType: "SubCategory",
                            orderDetail: 'subcategory'),
                        const SizedBox(height: 12),
                        OrderDetailsWidget(1,
                            orderDetailType: "Gross Wieght",
                            orderDetail: productModel.grossWeight),
                        const SizedBox(height: 12),
                        OrderDetailsWidget(
                          1,
                          orderDetailType: "Net Weight",
                          orderDetail: productModel.netWeight,
                        ),
                        const SizedBox(height: 12),
                        OrderDetailsWidget(
                          1,
                          orderDetailType: "Gold Purity",
                          orderDetail: model.goldpurity[0].goldPurity,
                        ),
                        const SizedBox(height: 12),
                        OrderDetailsWidget(
                          1,
                          orderDetailType: "Color",
                          orderDetail: model.color[0].color,
                        ),
                        const SizedBox(height: 12),
                        OrderDetailsWidget(
                          1,
                          orderDetailType: "Something",
                          orderDetail:
                              model.pos.trim().isEmpty ? "-" : model.pos.trim(),
                        ),
                        const SizedBox(height: 12),
                        OrderDetailsWidget(
                          1,
                          orderDetailType: "Quantity:",
                          orderDetail: '1',
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
