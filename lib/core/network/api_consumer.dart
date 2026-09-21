import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';

abstract class ApiConsumer {
  Future<Either<Failure, Map<String, dynamic>>> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<Failure, Map<String, dynamic>>> post({
    required String path,
    Map<String, dynamic>? data,
  });

  Future<Either<Failure, Map<String, dynamic>>> put({
    required String path,
    Map<String, dynamic>? data,
  });

  Future<Either<Failure, Map<String, dynamic>>> delete({
    required String path,
    Map<String, dynamic>? data,
  });
}