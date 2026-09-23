import 'package:mm_2/features/cart/domain/models/cart_getmodel.dart';
import 'package:mm_2/features/cart/domain/models/cart_postmodel.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final GetCartResponse cart;

  CartSuccessState(this.cart);
}

class CartAddSuccessState extends CartState {
  final AddItemToCartResponse cart;

  CartAddSuccessState(this.cart);
}

class CartFailureState extends CartState {
  final String message;

  CartFailureState(this.message);
}