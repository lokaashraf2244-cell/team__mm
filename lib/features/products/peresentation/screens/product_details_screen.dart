import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_2/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:mm_2/features/cart/presentation/cubit/cart_state.dart';
import 'package:mm_2/features/products/peresentation/cubit/product_cubit.dart';
import 'package:mm_2/features/products/peresentation/cubit/product_state.dart';
import 'package:mm_2/features/auth/presentation/screens/settings_screen.dart';
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProductCubit>().productDetails(
      productId: widget.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
        ),

        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return switch (state) {
            ProductDetailsLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),

            ProductDetailsFailureState(:final message) => Center(
              child: Text(message),
            ),

            ProductDetailsSuccessState(:final details) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    details.coverPictureUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          details.name,
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          details.description,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          '${details.price} EGP',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 24),

                        BlocConsumer<CartCubit, CartState>(
                          listener: (context, state) {
                            if (state is CartAddSuccessState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Product added to cart'),
                                ),
                              );
                            }

                            if (state is CartFailureState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            final isLoading = state is CartLoadingState;

                            return SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: FilledButton(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                  context.read<CartCubit>().addItemToCart(
                                    productId: details.id,
                                    quantity: 1,
                                  );
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF0B1F3A),
                                  foregroundColor: Colors.white,
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : const Text('Add To Cart'),
                              ),

                            );

                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            _ => const SizedBox.expand(),
          };
        },
      ),
    );
  }
}