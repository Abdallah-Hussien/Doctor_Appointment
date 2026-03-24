import 'package:doc_app/core/helper/validation_util.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import 'password_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
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
    passwordController = context.read<LoginCubit>().passwordController;

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
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Fill Email Field";
              } else if (ValidationUtil.isValidUserEmail(value)) {
                return "Enter a valid Email";
              }
              // return null;
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
        ],
      ),
    );
  }
}
