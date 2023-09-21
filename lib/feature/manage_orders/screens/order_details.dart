import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helper/name_helper.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../model/order_details_model.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({Key? key, required this.orderDetailsModel}) : super(key: key);

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
              body: _YourOrders(model: orderDetailsModel)),
        )
      ],
    ));
  }
}

class _YourOrders extends StatelessWidget {
  const _YourOrders({
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
            orderDetail: model.createdAt.toString(),
          ),
          const SizedBox(height: 16),
          OrderDetailsWidget(
            1,
            orderDetailType: "Last Updated At:",
            orderDetail: model.updatedAt.toString(),
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15),
          //   child: ListView.separated(
          //     itemCount: model.products.length,
          //     separatorBuilder: (_, __) => const SizedBox(height: 20),
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemBuilder: (_, index) {
          //       final productModel = model.products[index];
          //       return _YourProductsWidget(
          //         model: productModel,
          //         index: index,
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget(this.maxLines,
      {required this.orderDetailType,
      required this.orderDetail,
      this.images = const [],
      Key? key})
      : super(key: key);
  final String orderDetailType;
  final String orderDetail;
  final List<String> images;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    // final store = context.read<OrderStore>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: images.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  orderDetailType,
                  style: AppTextStyles.nunitoSansNormal
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final model = images[index];
                      // return CachedNetworkImage(
                      //   imageUrl: model,
                      //   imageBuilder: (context, imageProvider) => Container(
                      //     constraints: const BoxConstraints(maxWidth: 156),
                      //     decoration: BoxDecoration(
                      //         border: Border.all(
                      //           color: AppColors.logoColor,
                      //         ),
                      //         image: DecorationImage(
                      //           image: imageProvider,
                      //           fit: BoxFit.fitWidth,
                      //         )),
                      //   ),
                      //   placeholder: (context, url) => const LoadingWidget(),
                      //   errorWidget: (context, url, error) => ColoredBox(
                      //     color: Colors.white,
                      //     child: Center(
                      //       child: Image.asset('assets/png/app/logo.png',
                      //           height: 55),
                      //     ),
                      //   ),
                      // );
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemCount: images.length,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 180),
                    child: GestureDetector(
                      onTap: () async {
                        // for (final i in images) {
                        //   final uri = Uri.parse(i);
                        //   //
                        //   await store.downloadFile(
                        //     AttachmentModel(
                        //       fileName: uri.fileName,
                        //       fileUrl: i,
                        //     ),
                        //     null,
                        //   );
                        // }
                        // store.isImageLoading = false;
                        await showToast("Downloaded Images");
                      },
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: AppColors.deepGold,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            'Download Images',
                            style: AppTextStyles.nunitoSansNormal.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderDetailType,
                  style: AppTextStyles.nunitoSansNormal
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        orderDetail,
                        style: AppTextStyles.nunitoNormal,
                        overflow: TextOverflow.ellipsis,
                        maxLines: maxLines,
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
