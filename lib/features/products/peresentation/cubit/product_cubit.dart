import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mm_2/features/products/domain/usecase/get_products.dart';
import 'package:mm_2/features/products/domain/usecase/get_product_details.dart';

import 'package:mm_2/features/products/data/models/screen_product.dart';
import 'package:mm_2/features/products/data/models/product.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;
  final GetProductDetails getProductDetails;

  ProductCubit(
      this.getProducts,
      this.getProductDetails,
      ) : super(ProductInitialState());

  Future<void> fetchProducts() async {
    emit(ProductLoadingState());

    final result = await getProducts();

    result.fold(
          (failure) {
        final error = failure as Failure;

        emit(ProductFailureState(error.msg));
      },
          (data) {
        try {
          final response = screenproduct.fromJson(data);

          emit(ProductSuccessState(response.items));
        } catch (e) {
          emit(ProductFailureState(e.toString()));
        }
      },
    );
  }

  Future<void> productDetails({
    required String productId,
  }) async {
    emit(ProductDetailsLoadingState());

    final result = await getProductDetails(
      productId: productId,
    );

    result.fold(
          (failure) {
        emit(ProductDetailsFailureState(failure.msg));
      },
          (data) {
        try {
          final details = Product.fromJson(data);

          emit(
            ProductDetailsSuccessState(details),
          );
        } catch (e) {
          emit(
            ProductDetailsFailureState(e.toString()),
          );
        }
      },
    );
  }
}