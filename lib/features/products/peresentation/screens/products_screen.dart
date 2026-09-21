import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:mm_2/features/products/peresentation/cubit/product_cubit.dart';
import 'package:mm_2/features/products/peresentation/cubit/product_state.dart';
import 'package:mm_2/features/products/peresentation/screens/product_details_screen.dart';
import 'package:mm_2/features/auth/presentation/screens/settings_screen.dart';
import 'package:mm_2/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:mm_2/features/categories/presentation/cubit/categories_state.dart';

import 'package:mm_2/injection_container.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNTMyZGJlOS1iMGY2LTRjZTAtM2RkMC0wOGRmMTVkY2QxMGQiLCJqdGkiOiJkZTI5YTFjZi00OTViLTQ5NGItODkzOC1lZGQ0OTU5NjJlMDQiLCJlbWFpbCI6Imxva2EuYXNocmFmMjI0NEBnbWFpbC5jb20iLCJuYW1lIjoibG9rYSBhc2hyYWYiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3OTAyNDc5MjMsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.qWgP9smtZUVgc"
      "mMLcMuyE59w0wOq6_qPWxMLt-qnOck";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (_) => getIt<ProductCubit>(),
        ),

        BlocProvider<CategoriesCubit>(
          create: (_) =>
          getIt<CategoriesCubit>()..getCategories(),
        ),
      ],
      child: const _ProductsView(),
    );
  }
}

class _ProductsView extends StatefulWidget {
  const _ProductsView();

  @override
  State<_ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<_ProductsView> {
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();

    context.read<ProductCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1F3A),
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
        ),

        title: const Text(
          'ELORA Accessories',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
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

            ProductSuccessState(:final products) => CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _buildCategories(),
                ),

                SliverPadding(
                  padding: const EdgeInsets.all(12),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final product = products[index];

                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          clipBehavior: Clip.antiAlias,

                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 6,
                                child: InkWell(
                                  onTap: () {
                                    context.push(
                                      '/product-details?id=${product.id}',
                                    );
                                  },
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Image.network(
                                      product.coverPictureUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Center(
                                          child: Icon(
                                            Icons.image_not_supported,
                                            size: 45,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const Spacer(),

                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${product.price} EGP',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(
                                            width: 38,
                                            height: 38,
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons
                                                    .shopping_cart_outlined,
                                                size: 21,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },

                      childCount: products.length,
                    ),

                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.68,
                    ),
                  ),
                ),
              ],
            ),

            ProductDetailsLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),

            ProductDetailsSuccessState() => const SizedBox(),

            ProductDetailsFailureState(:final message) => Center(
              child: Text(message),
            ),

            _ => const SizedBox.expand(),
          };
        },
      ),
    );
  }

  Widget _buildCategories() {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return switch (state) {
          CategoriesInitialState() => const SizedBox(),

          CategoriesLoadingState() => const SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),

          CategoriesFailureState(:final message) => SizedBox(
            height: 100,
            child: Center(
              child: Text(message),
            ),
          ),

          CategoriesSuccessState(:final categories) => SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              itemCount: categories.categories.length + 1,

              itemBuilder: (context, index) {
                if (index == 0) {
                  return _categoryItem(
                    name: 'All',
                    imageUrl: null,
                    isSelected: selectedCategory == 'All',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'All';
                      });
                    },
                  );
                }

                final category =
                categories.categories[index - 1];

                return _categoryItem(
                  name: category.name,
                  imageUrl: category.coverPictureUrl,
                  isSelected:
                  selectedCategory == category.id,
                  onTap: () {
                    setState(() {
                      selectedCategory = category.id;
                    });
                  },
                );
              },
            ),
          ),

          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _categoryItem({
    required String name,
    required String? imageUrl,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 12),

        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF0B1F3A)
                      : Colors.grey.shade300,
                  width: isSelected ? 3 : 1,
                ),
              ),

              child: ClipOval(
                child: imageUrl == null
                    ? const Icon(
                  Icons.apps,
                  size: 30,
                )
                    : Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 30,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}