import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/core/network/api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio);

  @override
  Future<Either<Failure, Map<String, dynamic>>> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      debugPrint('========== GET REQUEST ==========');
      debugPrint('BASE URL: ${dio.options.baseUrl}');
      debugPrint('PATH: $path');
      debugPrint('FULL URL: ${dio.options.baseUrl}$path');
      debugPrint('QUERY: $queryParameters');
      debugPrint('=================================');

      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          contentType: null,
        ),
      );

      return Right(
        Map<String, dynamic>.from(response.data),
      );
    } on DioException catch (e) {
      debugPrint('========== GET ERROR ==========');
      debugPrint('STATUS CODE: ${e.response?.statusCode}');
      debugPrint('URL: ${e.requestOptions.uri}');
      debugPrint('METHOD: ${e.requestOptions.method}');
      debugPrint('HEADERS: ${e.requestOptions.headers}');
      debugPrint('DATA: ${e.requestOptions.data}');
      debugPrint('RESPONSE: ${e.response?.data}');
      debugPrint('================================');

      return Left(
        ServerFailure(
          msg: e.response?.data?.toString() ??
              e.message ??
              'Something went wrong',
        ),
      );
    }
  }
  @override
  Future<Either<Failure, Map<String, dynamic>>> post({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
      );

      return Right(
        Map<String, dynamic>.from(response.data),
      );
    } on DioException catch (e) {
      print('========== API ERROR ==========');
      print('STATUS CODE: ${e.response?.statusCode}');
      print('RESPONSE DATA: ${e.response?.data}');
      print('REQUEST DATA: $data');
      print('ERROR MESSAGE: ${e.message}');
      print('================================');

      return Left(
        ServerFailure(
          msg: e.response?.data?.toString() ??
              e.message ??
              'Something went wrong',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> put({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: data,
      );

      return Right(
        Map<String, dynamic>.from(response.data),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          msg: e.message ?? 'Something went wrong',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> delete({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
      );

      return Right(
        Map<String, dynamic>.from(response.data),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          msg: e.message ?? 'Something went wrong',
        ),
      );
    }
  }
}