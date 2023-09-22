import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/alert_dialog_box.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../model/manage_gold_purity_model.dart';

class ManageGoldPurity extends StatefulWidget {
  const ManageGoldPurity({Key? key}) : super(key: key);

  @override
  State<ManageGoldPurity> createState() => _ManageGoldPurityState();
}

class _ManageGoldPurityState extends State<ManageGoldPurity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<ManageGoldPurityModel> goldPurities = goldPurityList;

  final textController = TextEditingController();

  void removeItem(BuildContext context, ManageGoldPurityModel goldPurity) {
    setState(() {
      goldPurities.removeWhere((element) => element == goldPurity);
    });
  }

  Future<void> editItem(BuildContext context, String initialValue) async {
    final TextEditingController controller =
        TextEditingController(text: initialValue);

    final editedGoldPurity = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialogBox(
          textController: controller,
          buttonName: 'Update',
          screenName: 'Gold Purity',
        );
      },
    );

    if (editedGoldPurity != null && editedGoldPurity.isNotEmpty) {
      final index = goldPurities
          .indexWhere((goldPurity) => goldPurity.goldPurity == initialValue);

      if (index != -1) {
        setState(() {
          goldPurities[index] =
              ManageGoldPurityModel(goldPurity: editedGoldPurity);
        });
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(
        title: 'Manage Gold Purity',
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
            title: ' Add',
            action: () async {
              final category = await addItem(context, textController);
              if (category != null && category != "") {
                setState(() {
                  goldPurities.add(ManageGoldPurityModel(goldPurity: category));
                });
              }
            },
          ),
        ],
      ),
      drawer: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? const SideBar()
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: ListView.builder(
          itemCount: goldPurities.length,
          itemBuilder: (context, index) {
            final goldPurity = goldPurities[index];

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
                            goldPurity.goldPurity,
                            style: AppTextStyles.nunitoSansBold,
                          ),
                        ],
                      )),
                      IconButton(
                          onPressed: () {
                            editItem(context, goldPurity.goldPurity);
                          },
                          splashRadius: 10,
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.deepGold,
                            size: 16,
                          )),
                      IconButton(
                          onPressed: () {
                            removeItem(context, goldPurity);
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
        ),
      ),
    );
  }
}
