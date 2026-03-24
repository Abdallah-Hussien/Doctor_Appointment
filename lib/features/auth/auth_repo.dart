import 'package:doc_app/core/networking/api_error_handler.dart';
import 'package:doc_app/core/networking/api_result.dart';
import 'package:doc_app/core/networking/api_service.dart';
import 'package:doc_app/features/auth/login/data/model/login_request_body.dart';
import 'package:doc_app/features/auth/register/data/register_request_body.dart';

import 'login/data/model/login_response.dart';

class AuthRepo {
  final ApiService apiService;
  AuthRepo({required this.apiService});

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

    Future<ApiResult<LoginResponse>> register(
      RegisterRequestBody registerRequestBody) async {
    try {
      final response = await apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
