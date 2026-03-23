// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import 'widgets/email_and_password.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: TextStyles.font24BlueBold,
            ),
            verticalSpace(8),
            Text(
              'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
              style: TextStyles.font14GrayRegular,
            ),
            verticalSpace(36),
            Column(
              children: [
                const EmailAndPassword(),
                verticalSpace(24),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.font13BlueRegular,
                  ),
                ),
                verticalSpace(40),
                AppTextButton(
                  buttonText: "Login",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                  },
                ),
                verticalSpace(16),
                const TermsAndConditionsText(),
                verticalSpace(60),
                const DontHaveAccountText(),
              ],
            ),
          ],
        )),
      )),
    );
  }
}
