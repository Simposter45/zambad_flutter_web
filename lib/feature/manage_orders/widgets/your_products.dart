import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../model/order_details_model.dart';
import 'your_product_alert.dart';

class YourProducts extends StatelessWidget {
  const YourProducts({
    required this.model,
    Key? key,
  }) : super(key: key);

  final OrderDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const SizedBox(height: 50),
        Container(
          height: 54,
          decoration: const BoxDecoration(color: AppColors.grey5),
          child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(4),
                3: FlexColumnWidth(4),
                4: FlexColumnWidth(3),
                5: FlexColumnWidth(5),
                6: FlexColumnWidth(2),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: const [
                TableRow(
                  children: [
                    Align(
                      child: Text(
                        'Sl No.',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                    ),
                    Align(
                      child: Text(
                        'Image',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                    ),
                    Align(
                      child: Text(
                        'Product',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                    ),
                    Align(
                      child: Text(
                        'Gold Purity',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                    ),
                    Align(
                      child: Text(
                        'Color',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                    ),
                    Align(
                      child: Text(
                        'Attributes',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                    ),
                    Align(
                      child: Text(
                        'QTY',
                        style: AppTextStyles.nunitoSansBold,
                      ),
                    ),
                    SizedBox(height: 54),
                  ],
                ),
              ]),
        ),
        ListView.separated(
          itemCount: model.products.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            final productModel = model.products[index];
            return Table(
              border: const TableBorder(
                bottom: BorderSide(color: AppColors.grey7),
              ),
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(4),
                3: FlexColumnWidth(4),
                4: FlexColumnWidth(3),
                5: FlexColumnWidth(5),
                6: FlexColumnWidth(2),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  Align(
                      child: Text(
                    '${index + 1}',
                    style: AppTextStyles.sairaNormal,
                  )),
                  Align(
                      child: Image.asset(
                    productModel.image,
                  )),
                  Align(
                      child: Text(
                    productModel.title.length > 10
                        ? '${productModel.title.substring(0, 10)}...'
                        : productModel.title,
                    style: AppTextStyles.nunitoSansBold,
                  )),
                  Align(child: Text(model.goldpurity[0].goldPurity)),
                  Align(child: Text(model.color[0].color)),
                  const Align(child: Text('attributes')),
                  const Align(child: Text('1')),
                  Align(
                      child: IconButton(
                          splashRadius: 10,
                          onPressed: () => showDialog(
                              context: context,
                              builder: (context) {
                                return YourProductAlert(
                                    productModel: productModel, model: model);
                              }),
                          icon: const Icon(
                            Icons.info,
                            color: AppColors.deepGold,
                          ))),
                ]),
              ],
            );
          },
        ),
      ],
    );
  }
}

class YourProductsMobile extends StatelessWidget {
  const YourProductsMobile({
    required this.model,
    Key? key,
  }) : super(key: key);

  final OrderDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: model.products.length,
          itemBuilder: (context, index) {
            final productModel = model.products[index];
            return DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderGrey)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DecoratedBox(
                    decoration: BoxDecoration(color: AppColors.grey5),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 50,
                            child: Text(
                              'Image',
                              style: AppTextStyles.nunitoSansBold,
                            ),
                          ),
                          Text(
                            'Product',
                            style: AppTextStyles.nunitoSansBold,
                          ),
                          Text(
                            'Category',
                            style: AppTextStyles.nunitoSansBold,
                          ),
                          Text(
                            'Sub Category',
                            style: AppTextStyles.nunitoSansBold,
                          ),
                          Text(
                            'Attribute',
                            style: AppTextStyles.nunitoSansBold,
                          ),
                          Text(
                            'Quantity',
                            style: AppTextStyles.nunitoSansBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          productModel.image,
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          productModel.title.length > 10
                              ? productModel.title.substring(0, 10)
                              : productModel.title,
                          style: AppTextStyles.sairaNormal,
                        ),
                        Text(
                          productModel.category,
                          style: AppTextStyles.sairaNormal,
                        ),
                        const Text(
                          'sub Category',
                          style: AppTextStyles.sairaNormal,
                        ),
                        const Text(
                          'attributes',
                          style: AppTextStyles.sairaNormal,
                        ),
                        const Text(
                          '1',
                          style: AppTextStyles.sairaNormal,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          splashRadius: 10,
                          onPressed: () => showDialog(
                              context: context,
                              builder: (context) {
                                return YourProductAlert(
                                    productModel: productModel, model: model);
                              }),
                          icon: const Icon(
                            Icons.info,
                            color: AppColors.deepGold,
                          )),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
