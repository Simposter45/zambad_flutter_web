import 'package:flutter/material.dart';

import '../../_global/widgets/alert_dialog_box.dart';

class ManageStateModel {
  ManageStateModel({required this.state});
  String state;
}

List<ManageStateModel> statesList = [
  ManageStateModel(state: 'Maharashtra'),
  ManageStateModel(state: 'Maharashtra'),
  ManageStateModel(state: 'Maharashtra'),
  ManageStateModel(state: 'Maharashtra'),
  ManageStateModel(state: 'Maharashtra'),
  ManageStateModel(state: 'Maharashtra'),
  ManageStateModel(state: 'Maharashtra'),
];

Future<String?> addItem(
    BuildContext context, TextEditingController textController) async {
  //sdfsdf
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialogBox(
        textController: textController,
        buttonName: 'Add',
        screenName: 'State',
      );
    },
  );
}
