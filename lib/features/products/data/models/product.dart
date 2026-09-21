class Product {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;
  final double price;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.price,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      coverPictureUrl: json['coverPictureUrl'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      stock: json['stock'] ?? 0,
    );
  }
}