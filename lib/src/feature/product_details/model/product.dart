class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> variants;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.variants,
  });
}
