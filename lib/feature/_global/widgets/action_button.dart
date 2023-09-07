import 'package:first_proj/core/constants/colors.dart';
import 'package:first_proj/core/constants/styles.dart';
import 'package:first_proj/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.title,
    this.icon,
    required this.action,
  }) : super(key: key);
  final String? title;
  final IconData? icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => action,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
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
                  size: 16.0,
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
