import 'package:flutter/material.dart';
import 'package:transviti_assessment_test/utils/const/color.dart';
import 'package:transviti_assessment_test/views/sign_up/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue,
      body: SignUpBody(),
    );
  }
}
