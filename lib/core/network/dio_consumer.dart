import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio);

  @override
  Future<Either<Failure, Map<String, dynamic>>> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    print('get called');
    print('path: $path');
    print('queryParameters: $queryParameters');

    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: headers != null
            ? Options(headers: headers)
            : null,
      );

      print('========== API GET SUCCESS ==========');
      print('STATUS CODE: ${response.statusCode}');
      print('RESPONSE DATA: ${response.data}');
      print('======================================');

      final responseData = response.data;

      if (responseData is Map) {
        return Right(
          Map<String, dynamic>.from(responseData),
        );
      }

      return Right({
        'data': responseData,
      });
    } on DioException catch (e) {
      print('========== API GET ERROR ==========');
      print('STATUS CODE: ${e.response?.statusCode}');
      print('RESPONSE DATA: ${e.response?.data}');
      print('ERROR MESSAGE: ${e.message}');
      print('===================================');

      return Left(
        ServerFailure(
          msg: e.response?.data?.toString() ??
              e.message ??
              'Something went wrong',
        ),
      );
    } catch (e) {
      print('========== UNEXPECTED GET ERROR ==========');
      print(e);
      print('==========================================');

      return Left(
        ServerFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    print('post called');
    print('path: $path');
    print('data: $data');

    try {
      final response = await dio.post(
        path,
        data: data,
      );

      print('========== API POST SUCCESS ==========');
      print('STATUS CODE: ${response.statusCode}');
      print('RESPONSE DATA: ${response.data}');
      print('=======================================');

      final responseData = response.data;

      if (responseData is Map) {
        return Right(
          Map<String, dynamic>.from(responseData),
        );
      }

      return Right({
        'data': responseData,
      });
    } on DioException catch (e) {
      print('========== API POST ERROR ==========');
      print('STATUS CODE: ${e.response?.statusCode}');
      print('RESPONSE DATA: ${e.response?.data}');
      print('REQUEST DATA: $data');
      print('ERROR MESSAGE: ${e.message}');
      print('=====================================');

      return Left(
        ServerFailure(
          msg: e.response?.data?.toString() ??
              e.message ??
              'Something went wrong',
        ),
      );
    } catch (e) {
      print('========== UNEXPECTED POST ERROR ==========');
      print(e);
      print('============================================');

      return Left(
        ServerFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> put({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    print('put called');
    print('path: $path');
    print('data: $data');

    try {
      final response = await dio.put(
        path,
        data: data,
      );

      print('========== API PUT SUCCESS ==========');
      print('STATUS CODE: ${response.statusCode}');
      print('RESPONSE DATA: ${response.data}');
      print('======================================');

      final responseData = response.data;

      if (responseData is Map) {
        return Right(
          Map<String, dynamic>.from(responseData),
        );
      }

      return Right({
        'data': responseData,
      });
    } on DioException catch (e) {
      print('========== API PUT ERROR ==========');
      print('STATUS CODE: ${e.response?.statusCode}');
      print('RESPONSE DATA: ${e.response?.data}');
      print('REQUEST DATA: $data');
      print('ERROR MESSAGE: ${e.message}');
      print('===================================');

      return Left(
        ServerFailure(
          msg: e.response?.data?.toString() ??
              e.message ??
              'Something went wrong',
        ),
      );
    } catch (e) {
      print('========== UNEXPECTED PUT ERROR ==========');
      print(e);
      print('===========================================');

      return Left(
        ServerFailure(
          msg: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> delete({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    print('delete called');
    print('path: $path');
    print('data: $data');

    try {
      final response = await dio.delete(
        path,
        data: data,
      );

      print('========== API DELETE SUCCESS ==========');
      print('STATUS CODE: ${response.statusCode}');
      print('RESPONSE DATA: ${response.data}');
      print('=========================================');

      final responseData = response.data;

      if (responseData is Map) {
        return Right(
          Map<String, dynamic>.from(responseData),
        );
      }

      return Right({
        'data': responseData,
      });
    } on DioException catch (e) {
      print('========== API DELETE ERROR ==========');
      print('STATUS CODE: ${e.response?.statusCode}');
      print('RESPONSE DATA: ${e.response?.data}');
      print('REQUEST DATA: $data');
      print('ERROR MESSAGE: ${e.message}');
      print('=======================================');

      return Left(
        ServerFailure(
          msg: e.response?.data?.toString() ??
              e.message ??
              'Something went wrong',
        ),
      );
    } catch (e) {
      print('========== UNEXPECTED DELETE ERROR ==========');
      print(e);
      print('==============================================');

      return Left(
        ServerFailure(
          msg: e.toString(),
        ),
      );
    }
  }
}