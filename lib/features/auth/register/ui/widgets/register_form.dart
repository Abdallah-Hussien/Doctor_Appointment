// ignore_for_file: prefer_const_constructors

import 'package:doc_app/core/helper/validation_util.dart';
import 'package:doc_app/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../login/ui/widgets/password_validation.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<RegisterForm> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passwordController;

    passwordController.addListener(() {
      setState(() {
        hasLowercase = ValidationUtil.hasLowerCase(passwordController.text);
        hasUppercase = ValidationUtil.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            ValidationUtil.hasSpecialCharacter(passwordController.text);
        hasNumber = ValidationUtil.hasNumber(passwordController.text);
        hasMinLength = ValidationUtil.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Fill Name Field";
              }
              // if (!ValidationUtil.is(value)) {
              //   return "Enter a valid Email";
              // }
              // return null;
            },
            controller: context.read<RegisterCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            inputType: TextInputType.emailAddress,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Fill Email Field";
              }
              if (!ValidationUtil.isValidUserEmail(value)) {
                return "Enter a valid Email";
              }
              // return null;
            },
            controller: context.read<RegisterCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            inputType: TextInputType.phone,
            controller: context.read<RegisterCubit>().phoneController,
            hintText: 'Phone Number',
            suffixIcon: Icon(
              Icons.phone,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Fill Phone Field";
              }
              if (!ValidationUtil.isPhoneNumberValid(value)) {
                return "Enter a valid Phone Number";
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Fill Password Field";
              }
              if (!ValidationUtil.hasMinLength(value)) {
                return "Enter a valid password";
              }
              // return null;
            },
          ),
          verticalSpace(24),
          PasswordValidation(
            hasLowercase: hasLowercase,
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasUppercase: hasUppercase,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<RegisterCubit>().passwordConfirmController,
            hintText: 'Confirm Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Fill Confirm Password Field";
              }
              if (value != passwordController.text) {
                return "Confirm password isn't true";
              }
              // return null;
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
