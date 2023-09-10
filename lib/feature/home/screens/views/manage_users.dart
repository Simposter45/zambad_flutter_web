import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../_global/widgets/action_button.dart';
import '../../../_global/widgets/appbar_widget.dart';
import '../../model/manage_user_model.dart';

class ManageUsers extends StatelessWidget {
  ManageUsers({Key? key}) : super(key: key);
  List<ManageUserModel> users = getUsers();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 300,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Manage Users',
          actions: [
            ActionButton(
              icon: Icons.add,
              title: ' Create ID',
              action: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Padding(
                padding: const EdgeInsets.all(10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: AppColors.borderGrey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: AppTextStyles.nunitoSansBold,
                            ),
                            Text(
                              user.name,
                              style: AppTextStyles.nunitoSansNormal
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        )),
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
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
