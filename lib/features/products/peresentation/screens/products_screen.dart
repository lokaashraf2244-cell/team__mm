import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_2/features/products/peresentation/cubit/product_cubit.dart';
import 'package:mm_2/features/products/peresentation/cubit/product_state.dart';
import 'package:go_router/go_router.dart';
import 'package:mm_2/features/products/peresentation/screens/product_details_screen.dart';
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
        backgroundColor: const Color(0xFF0B1F3A),
        centerTitle: true,

        title: Text(
          'ELORA Accessories',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,

          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
            },
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
ProductSuccessState(:final products) => GridView.builder(
padding: const EdgeInsets.all(12),
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 12,
mainAxisSpacing: 12,
childAspectRatio: 0.68,
),
itemCount: products.length,
itemBuilder: (context, index) {
final product = products[index];

return Card(
elevation: 3,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
clipBehavior: Clip.antiAlias,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

// الصورة
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
errorBuilder: (context, error, stackTrace) {
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

// بيانات المنتج
Expanded(
flex: 4,
child: Padding(
padding: const EdgeInsets.all(10),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

// اسم المنتج
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

// السعر + السلة
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
onPressed: () {
// Add to cart
},
icon: const Icon(
Icons.shopping_cart_outlined,
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
) ,

            _ => const SizedBox.expand(),
          };
        },
      ),
    );
  }
}