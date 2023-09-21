import 'package:flutter/material.dart';

import '../constants/styles.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.isHovered,
    required this.firstText,
    required this.lastText,
    Key? key,
  }) : super(key: key);

  final bool isHovered;
  final String firstText;
  final String lastText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: firstText,
          style: AppTextStyles.nunitoSansBold.copyWith(
            color: isHovered ? Colors.white : Colors.black,
          ),
          children: [
            TextSpan(
              text: lastText,
              style: AppTextStyles.nunitoSansNormal.copyWith(
                color: isHovered ? Colors.white : Colors.black,
              ),
            )
          ]),
    );
  }
}
