import 'package:dio/dio.dart';
import 'package:doc_app/core/helper/shared_constants.dart';
import 'package:doc_app/core/helper/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.connectTimeout = timeOut
        ..interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ))
        ..options.headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(
            key: SharedConstants.userToken,
          )}',
        };
      return dio!;
    } else {
      return dio!;
    }
  }

  static resetUserTokenAfterLogin(String userToken) {
    dio?.options.headers = {'Authorization': 'Bearer $userToken'};
  }

  // static void addDioInterceptor() {
  //   dio?.interceptors.add(
  //     PrettyDioLogger(
  //       requestBody: true,
  //       requestHeader: true,
  //       responseHeader: true,
  //     ),
  //   );
  // }
}
