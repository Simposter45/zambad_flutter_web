import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../feature/home/screens/home_screen.dart';
import '../feature/login_page/screens/login_screen.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  showToast(String error) {
    Fluttertoast.showToast(
      msg: error,
      webPosition: "center",
      gravity: ToastGravity.CENTER,
    );
  }

  Future<void> logIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreenProviders()),
        );
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
        case "email-already-in-use":
          await showToast("User with this email already registered.");

          break;

        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          await showToast("Your password is wrong.");

          break;

        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          await showToast("User with this email doesn't exist.");

          break;

        case "ERROR_USER_DISABLED":
        case "user-disabled":
          await showToast("User with this email has been disabled.");

          break;

        case "ERROR_TOO_MANY_REQUESTS":
        case "too-many-requests":
          await showToast("Too many requests. Try again later.");

          break;

        case "ERROR_OPERATION_NOT_ALLOWED":
        case "operation-not-allowed":
          await showToast("Signing in with Email and Password is not enabled.");

          break;

        default:
          await showToast('Please check your details');
      }
    }
  }

  Future<void> forgotPass(
    BuildContext context,
    String email,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  Future<void> logout(BuildContext context) async {
    await _firebaseAuth.signOut().whenComplete(() => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false));
  }
}
