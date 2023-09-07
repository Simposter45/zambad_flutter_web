import 'package:first_proj/core/constants/colors.dart';

import 'package:flutter/material.dart';

class CheckMailPage extends StatelessWidget {
  final String email;
  const CheckMailPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.deepGold.withOpacity(.15),
            radius: 30,
            child: CircleAvatar(
              backgroundColor: AppColors.deepGold.withOpacity(0.3),
              radius: 20,
              child: const Icon(
                Icons.mail_outline,
                color: AppColors.deepGold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Check your email',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'We sent a password resent link to $email',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF828282),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              const Text(
                'Back to log in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF828282),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
