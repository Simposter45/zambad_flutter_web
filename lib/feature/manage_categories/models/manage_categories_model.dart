import 'package:flutter/material.dart';

import '../../_global/widgets/alert_dialog_box.dart';

class ManageCategoriesModel {
  ManageCategoriesModel({required this.category});
  String category;
}

List<ManageCategoriesModel> getCategories() {
  final List<ManageCategoriesModel> list = [
    ManageCategoriesModel(category: 'Bangle'),
    ManageCategoriesModel(category: 'Bracelet'),
    ManageCategoriesModel(category: 'Chain'),
    ManageCategoriesModel(category: 'EarRings'),
    ManageCategoriesModel(category: 'Long chains'),
    ManageCategoriesModel(category: 'Pendant'),
  ];

  return list;
}

Future<String?> addItem(
    BuildContext context, TextEditingController textController) async {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialogBox(
        textController: textController,
        buttonName: 'Add',
        screenName: 'Category',
      );
    },
  );
}
