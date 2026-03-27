// ignore_for_file: prefer_const_constructors

import 'package:doc_app/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:doc_app/features/auth/register/ui/widgets/already_have_account.dart';
import 'package:doc_app/features/auth/register/ui/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../login/ui/widgets/widgets.dart';
import 'widgets/register_bloc_listener.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(36),
              Column(
                children: [
                  RegisterForm(),
                  verticalSpace(40),
                  AppTextButton(
                    buttonText: "Create Account",
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      validateThenDoRegister(context);
                    },
                  ),
                  verticalSpace(16),
                  const TermsAndConditionsText(),
                  verticalSpace(60),
                  const AlreadyHaveAccountText(),
                  RegisterBlocListener()
                ],
              ),
            ],
          )),
        )),
      ),
    );
  }

  void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterStates();
    }
  }
}
