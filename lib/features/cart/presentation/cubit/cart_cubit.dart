import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_2/features/cart/domain/repos/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit({
    required this.cartRepo,
  }) : super(CartInitialState());

  Future<void> getCart() async {
    emit(CartLoadingState());

    final result = await cartRepo.getCart();

    result.fold(
          (failure) {
        emit(CartFailureState(failure.msg));
      },
          (cart) {
        emit(CartSuccessState(cart));
      },
    );
  }

  Future<void> addItemToCart({
    required String productId,
    required int quantity,
  }) async {
    emit(CartLoadingState());

    final result = await cartRepo.addItemToCart(
      productId: productId,
      quantity: quantity,
    );

    result.fold(
          (failure) {
        emit(CartFailureState(failure.msg));
      },
          (cart) async  {
        emit(CartAddSuccessState(cart));
        await getCart();
      },
    );
  }
}