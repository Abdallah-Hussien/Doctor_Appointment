import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
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
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzc0NDc2MzM2LCJleHAiOjE3NzQ1NjI3MzYsIm5iZiI6MTc3NDQ3NjMzNiwianRpIjoibWVGRW5XRkp1SnU1NVdkViIsInN1YiI6IjY3MDYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.5wZJlzF8mXr1VhgDv5ZtcJDNCdRIHJSni-KFKUoq1Uo',
        };
      return dio!;
    } else {
      return dio!;
    }
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
