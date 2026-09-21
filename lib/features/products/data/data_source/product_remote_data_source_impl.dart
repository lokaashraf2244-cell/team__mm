import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'product_remote_data_source.dart';
import 'package:mm_2/core/network/api_consumer.dart';
class ProductDataSourceImpl implements ProductDataSource {
  final ApiConsumer  apiConsumer;

  ProductDataSourceImpl(this.apiConsumer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProducts() async {
    print('========== PRODUCT REQUEST ==========');
    print('PATH: /api/products');

    final response = await apiConsumer.get(
      path: '/api/products',
    );

    print('PRODUCT RESPONSE: $response');
    print('=====================================');

    return response;
  }
  @override
  Future<Either<Failure, Map<String, dynamic>>> getProductDetails({
    required String productId,
  }) async {
    final response = await apiConsumer.get(
      path: '/api/products/$productId',
    );

    return response;
  }
}