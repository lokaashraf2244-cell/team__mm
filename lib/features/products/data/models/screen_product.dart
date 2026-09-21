import 'product.dart';

class screenproduct {
  final List<Product> items;

  screenproduct({
    required this.items,
  });

  factory screenproduct.fromJson(Map<String, dynamic> json) {
    final items = json['items'] as List<dynamic>? ?? [];

      return screenproduct(
      items: items
          .map(
            (item) => Product.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }
}