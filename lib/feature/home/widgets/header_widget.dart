import 'package:first_proj/core/constants/colors.dart';
import 'package:first_proj/core/constants/styles.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.text,
    required this.amount,
    required this.icon,
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
          width: MediaQuery.of(context).size.width * 0.2,
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
          width: MediaQuery.of(context).size.width * 0.19,
          height: 118,
          constraints: const BoxConstraints(
            minWidth: 250,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.deepGold),
              color: Colors.white,
              borderRadius: BorderRadius.circular(7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    style: AppTextStyles.nunitoSansBold.copyWith(fontSize: 24),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
