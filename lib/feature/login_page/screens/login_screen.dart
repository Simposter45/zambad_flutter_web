import 'package:first_proj/core/constants/colors.dart';
import 'package:first_proj/core/constants/styles.dart';
import 'package:first_proj/core/helper/name_helper.dart';
import 'package:first_proj/feature/login_page/screens/forgot_password_screen.dart';
import 'package:first_proj/feature/login_page/widgets/login_header.dart';
import 'package:first_proj/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  showPass() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoginHeader(),
              Container(
                constraints: const BoxConstraints(minWidth: 300),
                width: size.width * 0.3,
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderGrey2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: AppTextStyles.sairaNormal,
                    ),
                    const SizedBox(height: 3),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderGrey,
                            width: .5,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.errorColor)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Password', style: AppTextStyles.sairaNormal),
                    const SizedBox(height: 3),
                    TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                          // errorText: '',
                          suffixIcon: IconButton(
                            color: AppColors.deepGold,
                            icon: Icon(
                              showPassword
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                              size: 20,
                            ),
                            onPressed: () => showPass(),
                          ),
                          hintText: 'Enter Password',
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.borderGrey,
                              width: .5,
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.errorColor)),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.borderGrey),
                              borderRadius: BorderRadius.circular(4))),
                    ),
                    const SizedBox(height: 4),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen()),
                            );
                          },
                          child: const Text('Forgot password?',
                              style: AppTextStyles.sairaGoldSmall),
                        )),
                    const SizedBox(height: 20),
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
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              showToast('Email and password are required');
                            } else if (!isValidEmail(emailController.text)) {
                              showToast('Please enter a valid email address');
                            } else if (passwordController.text.length < 8) {
                              showToast(
                                  'Password must be at least 8 characters long');
                            } else {
                              await authProvider.logIn(
                                context,
                                emailController.text,
                                passwordController.text,
                              );
                            }
                          },
                          child: const Center(
                            child: Text('Login',
                                style: AppTextStyles.sairaWhiteBoldSmall),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
