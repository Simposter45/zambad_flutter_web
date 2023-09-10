import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../_global/widgets/action_button.dart';
import '../../../_global/widgets/appbar_widget.dart';
import '../../model/manage_categories_model.dart';

class ManageCategories extends StatelessWidget {
  ManageCategories({Key? key}) : super(key: key);

  List<ManageCategoriesModel> categories = getCategories();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 300,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Manage Categories',
          actions: [
            ActionButton(
              icon: Icons.add,
              title: ' Add ',
              action: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryCard(category: category);
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final ManageCategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                category.category,
                style: AppTextStyles.nunitoSansBold,
              ),
            ),
          )),
          const VerticalDivider(color: AppColors.borderGrey),
          IconButton(
              onPressed: () {},
              splashRadius: 10,
              icon: const Icon(
                Icons.edit,
                color: AppColors.deepGold,
                size: 16,
              )),
          IconButton(
              onPressed: () {},
              splashRadius: 10,
              icon: const Icon(
                Icons.delete,
                color: AppColors.deepGold,
                size: 16,
              )),
        ],
      ),
    );
  }
}
