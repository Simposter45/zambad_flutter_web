import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../_global/widgets/action_button.dart';
import '../../../_global/widgets/appbar_widget.dart';
import '../../model/manage_pos_model.dart';

class ManagePos extends StatelessWidget {
  ManagePos({Key? key}) : super(key: key);

  final List<ManagePosModel> posList = getPos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Manage POS',
        actions: [
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
            Expanded(
              child: ListView.builder(
                itemCount: posList.length,
                itemBuilder: (context, index) {
                  final posItem = posList[index];
                  return PosCard(posItem: posItem);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PosCard extends StatelessWidget {
  const PosCard({
    Key? key,
    required this.posItem,
  }) : super(key: key);

  final ManagePosModel posItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: AppColors.borderGrey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      posItem.posName,
                      style: AppTextStyles.nunitoSansBold,
                    ),
                  ),
                  IconButton(
                      splashRadius: 10,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info,
                        size: 14,
                        color: AppColors.deepGold,
                      )),
                  IconButton(
                      splashRadius: 10,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 14,
                        color: AppColors.deepGold,
                      )),
                  IconButton(
                      splashRadius: 10,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        size: 14,
                        color: AppColors.deepGold,
                      )),
                ],
              ),
              Text(
                posItem.date,
              ),
              if (posItem.description != null) Text(posItem.description!),
            ],
          ),
        ),
      ),
    );
  }
}
