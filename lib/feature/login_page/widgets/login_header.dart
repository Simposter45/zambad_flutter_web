import 'package:first_proj/core/constants/styles.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/png/login-page-icon.png'),
        const SizedBox(height: 10),
        const Text('Admin Panel', style: AppTextStyles.nunitoSansNormal),
        const SizedBox(height: 10),
      ],
    );
  }
}
