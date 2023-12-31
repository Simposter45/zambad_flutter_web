import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/responsive.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    required this.text,
    required this.amount,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String text;
  final int amount;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width * 0.20,
          height: 118,
          constraints: const BoxConstraints(
            minWidth: 258,
          ),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black26,
              offset: Offset(-1, 3),
            )
          ], color: AppColors.deepGold, borderRadius: BorderRadius.circular(7)),
        ),
        Container(
          width: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width * 0.89
              : MediaQuery.of(context).size.width * 0.19,
          height: 118,
          constraints: const BoxConstraints(
            minWidth: 250,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.deepGold),
              color: Colors.white,
              borderRadius: BorderRadius.circular(7)),
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightGold,
                  child: Icon(
                    icon,
                    color: AppColors.deepGold,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style:
                          AppTextStyles.nunitoSansNormal.copyWith(fontSize: 16),
                    ),
                    Text(
                      amount.toString(),
                      style:
                          AppTextStyles.nunitoSansBold.copyWith(fontSize: 24),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
