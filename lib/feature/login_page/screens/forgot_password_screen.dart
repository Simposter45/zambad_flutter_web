import 'package:first_proj/core/constants/colors.dart';
import 'package:first_proj/core/constants/styles.dart';
import 'package:first_proj/feature/login_page/screens/check_mail_page.dart';
import 'package:first_proj/feature/login_page/widgets/login_header.dart';
import 'package:first_proj/providers/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  String email = '';

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }

  showToast(String error) {
    Fluttertoast.showToast(
      msg: error,
      webPosition: "center",
      gravity: ToastGravity.CENTER,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthProvider authProvider = AuthProvider();

    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const LoginHeader(),
            Container(
              constraints: const BoxConstraints(minWidth: 300),
              width: size.width * 0.3,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderGrey2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Forgot password?',
                    style: AppTextStyles.sairaDeepGrey,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Email',
                    style: AppTextStyles.sairaDeepGrey.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500),
                      hintText: 'Enter Email',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.borderGrey,
                          width: .5,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.errorColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                AppColors.deepGold),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)))),
                        onPressed: () async {
                          if (_emailController.text.isEmpty) {
                            showToast('Email is required');
                          } else if (!isValidEmail(_emailController.text)) {
                            showToast('Please enter a Valid Email');
                          } else {
                            await authProvider
                                .forgotPass(
                                  context,
                                  _emailController.text.trim(),
                                )
                                .whenComplete(() =>
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => CheckMailPage(
                                          email: _emailController.text.trim(),
                                        ),
                                      ),
                                    ));
                          }
                        },
                        child: const Center(
                          child: Text('Continue',
                              style: AppTextStyles.sairaWhiteBoldSmall),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
