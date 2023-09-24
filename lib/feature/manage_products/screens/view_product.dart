import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../../manage_orders/screens/order_details.dart';
import '../../manage_orders/widgets/order_details_widget.dart';
import '../models/manage_product_model.dart';
import 'add_product.dart';

class ViewProduct extends StatelessWidget {
  ViewProduct({
    required this.productModel,
    Key? key,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ManageProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
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
                title: 'Product Details',
                widget:
                    Responsive.isTablet(context) || Responsive.isMobile(context)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                    title: 'Edit Products',
                    action: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddProduct(
                                productModel: productModel,
                              )));
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: (Responsive.isMobile(context))
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.chevron_left_rounded)),
                              const SizedBox(width: 20),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.deepGold)),
                                child: Image.asset(
                                  productModel.image,
                                  height: 300,
                                  width: 300,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.chevron_right_rounded)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Image.asset(productModel.image),
                          const SizedBox(height: 30),
                          OrderDetailsWidget(1,
                              orderDetailType:
                                  productModel.title.substring(0, 10),
                              orderDetail: ''),
                          OrderDetailsWidget(1,
                              orderDetailType:
                                  productModel.desc.substring(0, 10),
                              orderDetail: ''),
                          OrderDetailsWidget(1,
                              orderDetailType: "Design ID",
                              orderDetail: productModel.designId),
                          const SizedBox(height: 12),
                          OrderDetailsWidget(1,
                              orderDetailType: "Category",
                              orderDetail: productModel.category),
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
                          const SizedBox(height: 20),
                          Image.asset('assets/png/qr_code_sample.png'),
                          const SizedBox(height: 20),
                          TextButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AppColors.deepGold),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Download QR',
                              style: AppTextStyles.sairaWhiteBoldMedium,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 40),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.chevron_left_rounded)),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.deepGold)),
                                      child: Image.asset(
                                        productModel.image,
                                        height: 300,
                                        width: 300,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.chevron_right_rounded)),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Image.asset(productModel.image),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OrderDetailsWidget(1,
                                      orderDetailType:
                                          productModel.title.substring(0, 10),
                                      orderDetail: ''),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 34),
                                    child: Text(
                                      productModel.desc.substring(0, 10),
                                      style: AppTextStyles.nunitoNormal,
                                    ),
                                  ),
                                  OrderDetailsWidget(1,
                                      orderDetailType: "Design ID",
                                      orderDetail: productModel.designId),
                                  const SizedBox(height: 12),
                                  OrderDetailsWidget(1,
                                      orderDetailType: "Category",
                                      orderDetail: productModel.category),
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
                                  const SizedBox(height: 20),
                                  Image.asset('assets/png/qr_code_sample.png'),
                                  const SizedBox(height: 20),
                                  TextButton(
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          AppColors.deepGold),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Download QR',
                                      style: AppTextStyles.sairaWhiteBoldMedium,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              )),
        )
      ]),
    );
  }
}
