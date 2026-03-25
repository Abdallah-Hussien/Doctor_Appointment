
import 'package:bloc/bloc.dart';
import 'package:doc_app/features/auth/auth_repo.dart';
import 'package:doc_app/features/auth/register/data/register_request_body.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo _authRepo;
  RegisterCubit(this._authRepo) : super(const RegisterState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> emitRegisterStates() async {
    emit(const RegisterState.loading());
    var result = await _authRepo.register(RegisterRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: '0',
        password: passwordController.text,
        confirmPassword: passwordController.text));
    result.when(
      success: (data) {
        emit(RegisterState.success(data));
      },
      failure: (e) {
        e.apiErrorModel.message;
        emit(
          RegisterState.error(
              error: e.apiErrorModel.message ?? 'Unexpected Error'),
        );
      },
    );
  }
}
