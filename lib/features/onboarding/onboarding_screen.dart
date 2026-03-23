// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:doc_app/core/helper/spacing.dart';
import 'package:doc_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/app_text_button.dart';
import 'widgets/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              DocLogoAndName(),
              verticalSpace(30),
              DocImageAndText(),
              verticalSpace(18),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                      style: TextStyles.font13GrayRegular,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(30),
                    AppTextButton(
                      buttonText: 'Start',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
