import 'package:dio/dio.dart';

import 'api_constants.dart';

class DioFactory {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {

          'Accept': 'application/json',
        },
      ),
    );

    return dio;
  }
}