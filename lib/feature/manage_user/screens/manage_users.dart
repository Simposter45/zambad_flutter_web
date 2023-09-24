import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../model/manage_user_model.dart';
import '../store/user_store.dart';
import 'edit_user.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({Key? key}) : super(key: key);

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userStore = context.read<UserStore>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(
        title: 'Manage Users',
        widget: Responsive.isTablet(context) || Responsive.isMobile(context)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              )
            : const SizedBox(),
        actions: [
          ActionButton(
            icon: Icons.add,
            title: ' Create ID',
            action: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Provider.value(
                        value: userStore,
                        child: EditUser(),
                      )));
            },
          ),
        ],
      ),
      drawer: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? const SideBar()
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Observer(
          builder: (context) {
            return ListView.builder(
              itemCount: userStore.userList.length,
              itemBuilder: (context, index) {
                final user = userStore.userList[index];

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
                                user.salesId,
                                style: AppTextStyles.nunitoSansNormal
                                    .copyWith(fontSize: 14),
                              ),
                            ],
                          )),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          icon: Align(
                                            alignment: Alignment.topLeft,
                                            child: IconButton(
                                                splashRadius: 10,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(Icons.close)),
                                          ),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          content: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text('Name',
                                                  style: AppTextStyles
                                                      .nunitoSansBold),
                                              const SizedBox(height: 8),
                                              TextField(
                                                controller: nameController,
                                                autofocus: true,
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: AppColors
                                                                .deepGold),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: AppColors
                                                                .deepGold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          AppColors.green)),
                                              onPressed: () {
                                                final editedUser =
                                                    ManageUserModel(
                                                  name: nameController.text,
                                                  salesId:
                                                      'GbUOsNxtrvTe2nCrxMSqZVsicQo1',
                                                );
                                                if (editedUser
                                                    .name.isNotEmpty) {
                                                  userStore.edituser(
                                                      editedUser, user);
                                                }

                                                Navigator.of(context).pop();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 18),
                                                child: Text(
                                                  'Update',
                                                  style: AppTextStyles
                                                      .nunitoSansNormal
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ]);
                                    });
                              },
                              splashRadius: 10,
                              icon: const Icon(
                                Icons.edit,
                                color: AppColors.deepGold,
                                size: 16,
                              )),
                          IconButton(
                              onPressed: () {
                                userStore.deleteuser(user);
                              },
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
            );
          },
        ),
      ),
    );
  }
}
