import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
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
      return Left(
        ServerFailure(
          msg: e.message ?? 'Something went wrong',
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