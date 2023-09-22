import 'package:flutter/material.dart';

import '../../_global/widgets/alert_dialog_box.dart';

class ManageGoldPurityModel {
  ManageGoldPurityModel({required this.goldPurity});
  String goldPurity;
}

List<ManageGoldPurityModel> goldPurityList = [
  ManageGoldPurityModel(goldPurity: '24K'),
  ManageGoldPurityModel(goldPurity: '22K'),
  ManageGoldPurityModel(goldPurity: '10K'),
  ManageGoldPurityModel(goldPurity: '2K'),
  ManageGoldPurityModel(goldPurity: '10K'),
  ManageGoldPurityModel(goldPurity: 'Diamond Carat'),
];

Future<String?> addItem(
    BuildContext context, TextEditingController textController) async {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialogBox(
        textController: textController,
        buttonName: 'Add',
        screenName: 'Gold Purity',
      );
    },
  );
}
