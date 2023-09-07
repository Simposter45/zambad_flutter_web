import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../_global/widgets/action_button.dart';
import '../../../_global/widgets/appbar_widget.dart';
import '../../model/manage_product_model.dart';

class ManageProducts extends StatelessWidget {
  ManageProducts({Key? key}) : super(key: key);

  final List<ManageProductModel> productList = getProducts();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Manage Products',
        actions: [
          ActionButton(
            title: 'Generate Excel',
            action: () {},
          ),
          ActionButton(
            icon: Icons.add,
            title: ' Add Product',
            action: () {},
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
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
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      children: [
                        const Center(
                          child: Text('Filter Options'),
                        )
                      ],
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.sort),
                      SizedBox(width: 10),
                      Text(
                        'Filter',
                        style: AppTextStyles.nunitoSansNormal,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 50,
                    childAspectRatio: .8,
                    crossAxisCount: Responsive.isDesktop(context) ? 3 : 2,
                  ),
                  itemCount: productList.length,
                  itemBuilder: (_, index) {
                    final productModel = productList[index];
                    return ProductCard(productModel: productModel);
                  }),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.productModel,
    Key? key,
  }) : super(key: key);

  final ManageProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.deepGold,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              productModel.image,
              fit: BoxFit.cover,
            ),
          ),
          const Divider(color: AppColors.deepGold),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: AppTextStyles.nunitoSansBold.copyWith(fontSize: 16),
                ),
                Text(
                  productModel.desc,
                  style: AppTextStyles.nunitoSansNormal.copyWith(fontSize: 10),
                ),
                Text(
                  'Net weight: ${productModel.netWeight}',
                  style: AppTextStyles.nunitoSansNormal.copyWith(fontSize: 12),
                ),
                Text(
                  'Gross weight: ${productModel.grossWeight}',
                  style: AppTextStyles.nunitoSansNormal.copyWith(fontSize: 12),
                ),
                Text(
                  'Design Id: ${productModel.designId}',
                  style: AppTextStyles.nunitoSansNormal.copyWith(fontSize: 12),
                ),
                Text(
                  'Category: ${productModel.category}',
                  style: AppTextStyles.nunitoSansNormal.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.lightGold),
                side: MaterialStatePropertyAll(
                    BorderSide(color: AppColors.deepGold))),
            onPressed: () {},
            child: const Text(
              'View Product',
              style: AppTextStyles.sairaGoldMedium,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
