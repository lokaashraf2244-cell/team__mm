import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_getmodel.freezed.dart';
part 'cart_getmodel.g.dart';

@freezed
abstract class GetCartResponse with _$GetCartResponse {
  const factory GetCartResponse({
    required String cartId,
    required List<CartItemResponse> cartItems,
  }) = _GetCartResponse;

  factory GetCartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseFromJson(json);
}

@freezed
abstract class CartItemResponse with _$CartItemResponse {
  const factory CartItemResponse({
    required String itemId,
    required String productId,
    required String productName,
    required String productCoverUrl,
    required int productStock,
    required double weightInGrams,
    required int quantity,
    required double discountPercentage,
    required double basePricePerUnit,
    required double finalPricePerUnit,
    required double totalPrice,
  }) = _CartItemResponse;

  factory CartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CartItemResponseFromJson(json);
}