// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_postmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddItemToCartResponse _$AddItemToCartResponseFromJson(
  Map<String, dynamic> json,
) => _AddItemToCartResponse(
  message: json['message'] as String,
  id: json['id'] as String?,
  productId: json['productId'] as String?,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$AddItemToCartResponseToJson(
  _AddItemToCartResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'id': instance.id,
  'productId': instance.productId,
  'quantity': instance.quantity,
};
