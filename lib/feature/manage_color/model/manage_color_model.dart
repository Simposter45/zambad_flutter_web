import 'package:flutter/material.dart';

import '../../_global/widgets/alert_dialog_box.dart';

class ManageColorModel {
  ManageColorModel({required this.color});
  String color;
}

final List<ManageColorModel> colorList = [
  ManageColorModel(color: 'Blue'),
  ManageColorModel(color: 'Gold'),
  ManageColorModel(color: 'Red'),
  ManageColorModel(color: 'Rose Gold'),
  ManageColorModel(color: 'Black'),
  ManageColorModel(color: 'White Gold'),
];

Future<String?> addItem(
    BuildContext context, TextEditingController textController) async {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialogBox(
        textController: textController,
        buttonName: 'Add',
        screenName: 'Color',
      );
    },
  );
}
