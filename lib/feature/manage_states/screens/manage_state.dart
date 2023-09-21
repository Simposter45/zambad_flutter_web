import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';
import '../../_global/widgets/action_button.dart';
import '../../_global/widgets/alert_dialog_box.dart';
import '../../_global/widgets/appbar_widget.dart';
import '../../home/widgets/side_bar.dart';
import '../../manage_states/model/manage_state_model.dart';

class ManageState extends StatefulWidget {
  const ManageState({Key? key}) : super(key: key);

  @override
  State<ManageState> createState() => _ManageStateState();
}

class _ManageStateState extends State<ManageState> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final textController = TextEditingController();

  List<ManageStateModel> states = getStates();

  void removeItem(BuildContext context, ManageStateModel state) {
    setState(() {
      states.remove(state);
    });
  }

  Future<void> editItem(BuildContext context, String initialValue) async {
    final TextEditingController controller =
        TextEditingController(text: initialValue);

    final editedStates = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialogBox(
          textController: controller,
          buttonName: 'Update',
          screenName: 'State',
        );
      },
    );

    if (editedStates != null && editedStates.isNotEmpty) {
      final index = states.indexWhere((state) => state.state == initialValue);

      if (index != -1) {
        setState(() {
          states[index] = ManageStateModel(state: editedStates);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(
        title: 'Manage States',
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
                  states.add(ManageStateModel(state: color));
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
          itemCount: states.length,
          itemBuilder: (context, index) {
            final state = states[index];

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
                            state.state,
                            style: AppTextStyles.nunitoSansBold,
                          ),
                        ],
                      )),
                      IconButton(
                          onPressed: () {
                            editItem(context, state.state);
                          },
                          splashRadius: 10,
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.deepGold,
                            size: 16,
                          )),
                      IconButton(
                          onPressed: () {
                            removeItem(context, state);
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
