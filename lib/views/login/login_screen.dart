import 'package:flutter/material.dart';
import 'package:transviti_assessment_test/utils/const/color.dart';
import 'package:transviti_assessment_test/views/login/body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue,
      body: LoginBody(),
    );
  }
}
