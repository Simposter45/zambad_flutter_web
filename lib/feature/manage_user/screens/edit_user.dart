import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../model/manage_user_model.dart';
import '../store/user_store.dart';

class EditUser extends StatefulWidget {
  EditUser({
    Key? key,
  }) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userStore = context.read<UserStore>();
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
                title: 'Create ID',
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
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      const Text('Create ID',
                          style: AppTextStyles.nunitoSansBold),
                      const SizedBox(height: 10),
                      const Text('First Name',
                          style: AppTextStyles.nunitoSansNormal),
                      const SizedBox(height: 5),
                      TextField(
                        controller: nameController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Enter name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                const BorderSide(color: AppColors.borderGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                const BorderSide(color: AppColors.borderGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Email Address',
                          style: AppTextStyles.nunitoSansNormal),
                      const SizedBox(height: 5),
                      TextField(
                        controller: emailController,
                        autofocus: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Enter Description',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                const BorderSide(color: AppColors.borderGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                const BorderSide(color: AppColors.borderGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Password',
                          style: AppTextStyles.nunitoSansNormal),
                      const SizedBox(height: 5),
                      TextField(
                        controller: passwordController,
                        autofocus: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Enter Description',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                const BorderSide(color: AppColors.borderGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                const BorderSide(color: AppColors.borderGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Confirm Password',
                          style: AppTextStyles.nunitoSansNormal),
                      const SizedBox(height: 5),
                      TextField(
                        controller: confirmPassController,
                        autofocus: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Enter Description',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                const BorderSide(color: AppColors.borderGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                const BorderSide(color: AppColors.borderGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        child: TextButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AppColors.deepGold),
                            ),
                            onPressed: () {
                              final newUser = ManageUserModel(
                                name: nameController.text,
                                salesId: 'GbUOsNxtrvTe2nCrxMSqZVsicQo1',
                              );

                              if (newUser.name.isNotEmpty) {
                                userStore.adduser(newUser);
                              }
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Create',
                                style: AppTextStyles.nunitoSansNormal
                                    .copyWith(color: Colors.white),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
