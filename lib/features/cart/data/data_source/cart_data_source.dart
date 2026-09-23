
import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';

abstract class CartDataSource {
Future<Either<Failure, Map<String, dynamic>>> getCart();

Future<Either<Failure, Map<String, dynamic>>> addItemToCart({
required String productId,
required int quantity,
});
}
