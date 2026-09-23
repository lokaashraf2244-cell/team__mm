import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_postmodel.freezed.dart';
part 'cart_postmodel.g.dart';

@freezed
abstract class AddItemToCartResponse with _$AddItemToCartResponse {
  const factory AddItemToCartResponse({
    required String message,
    String? id,
    String? productId,
    required int quantity,
  }) = _AddItemToCartResponse;

  factory AddItemToCartResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$AddItemToCartResponseFromJson(json);
}