import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/features/cart/data/data_source/cart_data_source.dart';
import 'package:mm_2/features/cart/domain/models/cart_getmodel.dart';
import 'package:mm_2/features/cart/domain/models/cart_postmodel.dart';
import 'package:mm_2/features/cart/domain/repos/cart_repo.dart';


class CartRepoImpl implements CartRepo {
  final CartDataSource cartDataSource;

  CartRepoImpl({
    required this.cartDataSource,
  });

  @override
  Future<Either<Failure, GetCartResponse>> getCart() async {
    final response = await cartDataSource.getCart();

    return response.fold(
          (failure) => Left(failure),
          (data) {
        try {
          final cartResponse = GetCartResponse.fromJson(data);

          return Right(cartResponse);
        } catch (e) {
          return Left(
            DataMappingFailure(msg: e.toString()),
          );
        }
      },
    );
  }

  @override
  Future<Either<Failure, AddItemToCartResponse>> addItemToCart({
    required String productId,
    required int quantity,
  }) async {
    final response = await cartDataSource.addItemToCart(
      productId: productId,
      quantity: quantity,
    );

    return response.fold(
          (failure) => Left(failure),
          (data) {
        try {
          final cartResponse = AddItemToCartResponse.fromJson(data);

          return Right(cartResponse);
        } catch (e) {
          return Left(
            DataMappingFailure(msg: e.toString()),
          );
        }
      },
    );
  }
}