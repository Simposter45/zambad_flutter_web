import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.action,
    Key? key,
    this.title,
    this.icon,
  }) : super(key: key);
  final String? title;
  final IconData? icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => action,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.lightGold,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: 16,
                  color: AppColors.deepGold,
                ),
              if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                Text(title!, style: AppTextStyles.sairaGoldMedium)
            ],
          ),
        ),
      ),
    );
  }
}
