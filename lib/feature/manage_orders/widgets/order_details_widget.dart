import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helper/name_helper.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    orderDetailType,
                    style: AppTextStyles.nunitoSansBold,
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      orderDetail,
                      style: AppTextStyles.nunitoNormal,
                      overflow: TextOverflow.ellipsis,
                      maxLines: maxLines,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
