import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transviti_assessment_test/utils/widget/dialog.dart';
import 'package:transviti_assessment_test/views/home/home_screen.dart';
import 'package:transviti_assessment_test/views/login/login_screen.dart';

class AuthProviders extends ChangeNotifier {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController conPasswordController = TextEditingController();

  void logIn(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email == "" || password == "") {
      UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields");
    } else {
      UIHelper.showLoadingDialog(context, "Logging In..");
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
        clearController();
        log('login');
      } on FirebaseAuthException catch (ex) {
        // Close the loading dialog
        Navigator.pop(context);

        // Show Alert Dialog
        UIHelper.showAlertDialog(context, "An error occured", ex.message.toString());
      }
    }
  }

  Future signUp(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String conPassword = conPasswordController.text.trim();
    UserCredential? credential;

    if (email == "" || password == "" || conPassword == '') {
      UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields");
    } else if (password != conPassword) {
      UIHelper.showAlertDialog(context, "Password are not same", "Please Check the Password");
    } else {
      UIHelper.showLoadingDialog(context, "Creating new account..");
      try {
        credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (ex) {
        Navigator.pop(context);
        UIHelper.showAlertDialog(context, "An error occured", ex.message.toString());
      }
      if (credential != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LogInScreen();
            },
          ),
        );
      }
      log('signUp');
      clearController();
    }
  }

  clearController() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
