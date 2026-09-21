import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';

abstract class CategoriesDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getcategories();
}