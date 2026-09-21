import 'package:dartz/dartz.dart';

import 'package:mm_2/core/errors/failure.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call() async {
    return await repository.getProducts();
  }
}