import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../manage_categories/models/manage_categories_model.dart';

class FilterDialog extends StatelessWidget {
  FilterDialog({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<ManageCategoriesModel> categories;
  bool isTapped = false;

  onCheckBoxTap(bool val) {
    isTapped = val;
  }

  final List subCategories = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 700,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: AppColors.grey2,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 16, top: 20),
                    child: Text(
                      "Categories & Subcategories",
                      style: AppTextStyles.nunitoSansBold.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 47),
                child: Text(
                  "Select",
                  style: AppTextStyles.nunitoSansNormal.copyWith(
                    color: AppColors.grey8,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final model = categories[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (val) => onCheckBoxTap(val!),
                              activeColor: AppColors.deepGold,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            const SizedBox(width: 8),
                            DecoratedBox(
                              decoration: const BoxDecoration(
                                color: AppColors.lightGold,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Center(
                                  child: Text(
                                    model.category,
                                    style:
                                        AppTextStyles.sairaGoldSmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Wrap(spacing: 10, runSpacing: 15, children: [
                          for (int i = 0; i < 7; i++)
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all()),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Text('Type ${i + 1}',
                                    style:
                                        AppTextStyles.sairaGoldSmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                        ]),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
              const SizedBox(height: 50),
              Align(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 170,
                      decoration: const BoxDecoration(
                        color: AppColors.deepGold,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: AppTextStyles.sairaWhiteBoldSmall.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
