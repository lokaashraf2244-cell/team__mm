import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mm_2/core/constant/local_keys.dart';
import 'package:mm_2/core/local_storage/base_local_storage.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors({
    required this.localStorage,
  });

  final BaseLocalStorage localStorage;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final token = await localStorage.getString(LocalKeys.token);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    if (kDebugMode) {
      log('REQUEST[${options.method}] => PATH: ${options.path}');
      log('Headers: ${options.headers}');
    }

    handler.next(options);
  }

  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) async {
    if (kDebugMode) {
      log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }

    handler.next(response);
  }

  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) {
    if (kDebugMode) {
      log(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );

      if (err.response?.data != null) {
        log('Error data: ${err.response?.data}');
      }
    }

    handler.next(err);
  }
}