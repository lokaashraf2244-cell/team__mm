import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, Map<String, dynamic>>> getProducts();

  Future<Either<Failure, Map<String, dynamic>>> getProductDetails({
    required String productId,
  });
}