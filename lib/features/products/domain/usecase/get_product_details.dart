import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import '../repositories/product_repository.dart';

class GetProductDetails {
  final ProductRepository repository;

  GetProductDetails(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call({
    required String productId,
  }) async {
    return await repository.getProductDetails(
      productId: productId,
    );
  }
}