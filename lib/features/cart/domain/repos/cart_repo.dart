import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/features/cart/domain/models/cart_getmodel.dart';
import 'package:mm_2/features/cart/domain/models/cart_postmodel.dart';

abstract class CartRepo {
  Future<Either<Failure, GetCartResponse>> getCart();

  Future<Either<Failure, AddItemToCartResponse>> addItemToCart({
    required String productId,
    required int quantity,
  });
}