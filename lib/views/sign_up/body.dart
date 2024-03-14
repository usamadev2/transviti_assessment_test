import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transviti_assessment_test/controller/auth_controller.dart';
import 'package:transviti_assessment_test/utils/const/color.dart';
import 'package:transviti_assessment_test/utils/extentions/extention.dart';
import 'package:transviti_assessment_test/utils/widget/custom_container.dart';
import 'package:transviti_assessment_test/utils/widget/custom_textfield.dart';

import '../../../../utils/widget/custom_button.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            30.0.spaceY,
            Image.asset(r'assets/PrepPace_logo.png', height: 110.h),
            10.0.spaceY,
            Container(
              height: 420.h,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipPath(
                        clipper: CustomShap(),
                        child: Container(
                          height: 400.h,
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 14.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 44.r,
                        backgroundColor: AppColors.darkBlue,
                        child: Icon(
                          Icons.person,
                          color: AppColors.gray,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomTextField(
                        hintText: 'Email address',
                        suffixWidget: Icon(
                          Icons.email,
                          color: AppColors.darkBlue,
                        ),
                        textEditingController: authProvider.emailController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0, left: 8.0, bottom: 126.0.h),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomTextField(
                        suffixWidget: Icon(
                          Icons.lock,
                          color: AppColors.darkBlue,
                        ),
                        hintText: 'Password',
                        textEditingController: authProvider.passwordController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0, left: 8.0, bottom: 65.0.h),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CustomTextField(
                        suffixWidget: Icon(
                          Icons.lock,
                          color: AppColors.darkBlue,
                        ),
                        hintText: 'Confirm Password',
                        textEditingController: authProvider.conPasswordController,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      onPressed: () {
                        authProvider.signUp(context);
                      },
                      text: 'Sign Up',
                      backgroundColor: AppColors.darkBlue,
                      width: 70.w,
                      height: 40.h,
                    ),
                  ),
                ],
              ),
            ),
            20.0.spaceY,
            Align(
              alignment: Alignment.bottomLeft,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  radius: 24.r,
                  backgroundColor: AppColors.darkBlue,
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
