
import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/core/network/api_consumer.dart';
import 'package:mm_2/core/network/api_constants.dart';

import 'cart_data_source.dart';

class CartDataSourceImpl implements CartDataSource {
final ApiConsumer apiConsumer;

CartDataSourceImpl(this.apiConsumer);

@override
Future<Either<Failure, Map<String, dynamic>>> getCart() async {
print('========== CART GET REQUEST ==========');
print('PATH: ${ApiConstants.getCart}');

final response = await apiConsumer.get(
path: ApiConstants.getCart,
);

print('========== CART GET RESPONSE ==========');
print(response);
print('=======================================');

return response;
}

@override
Future<Either<Failure, Map<String, dynamic>>> addItemToCart({
required String productId,
required int quantity,
}) async {
print('========== ADD TO CART REQUEST ==========');
print('PATH: ${ApiConstants.addItemToCart}');
print('Product ID: $productId');
print('Quantity: $quantity');

final response = await apiConsumer.post(
path: ApiConstants.addItemToCart,
data: {
'productId': productId,
'quantity': quantity,
},
);

print('========== ADD TO CART RESPONSE ==========');
print(response);
print('==========================================');

return response;
}
}