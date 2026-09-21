import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_2/features/products/peresentation/cubit/product_cubit.dart';
import 'package:mm_2/features/products/peresentation/cubit/product_state.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return switch (state) {
            ProductInitialState() => const SizedBox(),

            ProductLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),

            ProductFailureState(:final message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      context.read<ProductCubit>().fetchProducts();
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),
            ProductSuccessState(:final products) => ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 15);
              },
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Image.network(
                      product.coverPictureUrl,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Text(
                      '${product.price} EGP',
                    ),
                  ),
                );
              },
            ),
            _ => const SizedBox.expand(),
          };
        },
      ),
    );
  }
}