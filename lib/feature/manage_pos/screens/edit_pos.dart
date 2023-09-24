import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../model/manage_pos_model.dart';
import '../store/pos_store.dart';

class EditPos extends StatefulWidget {
  const EditPos({
    required this.actionName,
    required this.buttonName,
    this.existingPos,
    Key? key,
  }) : super(key: key);

  final ManagePosModel? existingPos;
  final String actionName;
  final String buttonName;

  @override
  State<EditPos> createState() => _EditPosState();
}

class _EditPosState extends State<EditPos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final nameController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.existingPos != null) {
      nameController.text = widget.existingPos!.posName;
      descController.text = widget.existingPos!.description ?? '';
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final posStore = context.read<PosStore>();
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
            drawer: Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const SideBar()
                : null,
            appBar: AppBarWidget(
              title: '${widget.actionName} POS',
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
                    const Text('Basic Info',
                        style: AppTextStyles.nunitoSansBold),
                    const SizedBox(height: 5),
                    const Text('Pos Name',
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
                    const SizedBox(height: 5),
                    const Text('Description (Optional)',
                        style: AppTextStyles.nunitoSansNormal),
                    const SizedBox(height: 5),
                    TextField(
                      controller: descController,
                      autofocus: true,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
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
                            if (widget.existingPos != null) {
                              final editedPos = ManagePosModel(
                                posName: nameController.text,
                                date:
                                    DateTime.now().toString().substring(0, 11),
                                description: descController.text,
                              );
                              if (editedPos.posName.isNotEmpty) {
                                posStore.editPos(
                                    editedPos, widget.existingPos!);
                              }
                            } else {
                              final newPos = ManagePosModel(
                                posName: nameController.text,
                                date:
                                    DateTime.now().toString().substring(0, 11),
                                description: descController.text,
                              );

                              if (newPos.posName.isNotEmpty) {
                                posStore.addPos(newPos);
                              }
                            }

                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              widget.buttonName,
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
    ));
  }
}
