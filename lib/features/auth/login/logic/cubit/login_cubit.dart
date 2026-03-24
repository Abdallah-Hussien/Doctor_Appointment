import 'package:bloc/bloc.dart';
import 'package:doc_app/features/auth/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/login_request_body.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  LoginCubit(this._authRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  emitLoginStates() async {
    emit(const LoginState.loading());
    final result = await _authRepo.login(LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ));
    result.when(
      success: (loginResponse) {
        // saveUserToken(loginResponse.userData!.token);
        emit(LoginState.success(loginResponse));
      },
      failure: (e) {
        emit(LoginState.error(
            error: e.apiErrorModel.message ?? 'Error Happened'));
      },
    );
  }
}

// Future<void> saveUserToken(String? token) async{

// }
