import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox({
    required this.textController,
    required this.screenName,
    required this.buttonName,
    Key? key,
  }) : super(key: key);

  final TextEditingController textController;
  final String screenName;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
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
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$buttonName $screenName', style: AppTextStyles.nunitoSansBold),
          const SizedBox(height: 5),
          Text('Enter the $screenName name & click on the $buttonName Button',
              style: AppTextStyles.nunitoSansNormal),
          const SizedBox(height: 8),
          TextField(
            controller: textController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: '$buttonName $screenName',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: AppColors.deepGold),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: AppColors.deepGold),
              ),
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.green)),
          onPressed: () {
            Navigator.of(context).pop(textController.text);
            textController.clear();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            child: Text(
              buttonName,
              style:
                  AppTextStyles.nunitoSansNormal.copyWith(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
