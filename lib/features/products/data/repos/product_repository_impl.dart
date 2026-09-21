import 'package:dartz/dartz.dart';

import 'package:mm_2/core/errors/failure.dart';
import '../../data/data_source/product_remote_data_source.dart';
import 'package:mm_2/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProducts() async {
    return await dataSource.getProducts();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProductDetails({
    required String productId,
  }) async {
    return await dataSource.getProductDetails(
      productId: productId,
    );
  }
}