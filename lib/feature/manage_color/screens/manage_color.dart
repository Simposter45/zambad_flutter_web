import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../../_global/widgets/alert_dialog_box.dart';
import '../model/manage_color_model.dart';

class ManageColor extends StatefulWidget {
  const ManageColor({Key? key}) : super(key: key);

  @override
  State<ManageColor> createState() => _ManageColorState();
}

class _ManageColorState extends State<ManageColor> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final textController = TextEditingController();

  List<ManageColorModel> colors = colorList;

  void removeItem(BuildContext context, ManageColorModel color) {
    setState(() {
      colors.remove(color);
    });
  }

  Future<void> editItem(BuildContext context, String initialValue) async {
    final TextEditingController controller =
        TextEditingController(text: initialValue);

    final editedColor = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialogBox(
          textController: controller,
          buttonName: 'Update',
          screenName: 'Color',
        );
      },
    );

    if (editedColor != null && editedColor.isNotEmpty) {
      final index = colors.indexWhere((color) => color.color == initialValue);

      if (index != -1) {
        setState(() {
          colors[index] = ManageColorModel(color: editedColor);
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
        title: 'Manage Color',
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
              final color = await addItem(context, textController);
              if (color != null && color != "") {
                setState(() {
                  colors.add(ManageColorModel(color: color));
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
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final color = colors[index];

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
                            color.color,
                            style: AppTextStyles.nunitoSansBold,
                          ),
                        ],
                      )),
                      IconButton(
                          onPressed: () {
                            editItem(context, color.color);
                          },
                          splashRadius: 10,
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.deepGold,
                            size: 16,
                          )),
                      IconButton(
                          onPressed: () {
                            removeItem(context, color);
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
