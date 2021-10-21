class Product {
  final int id;
  final String name;
  final String description;
  final String category;
  final double price;
  final bool available;
  final String img;
  bool isFavorite;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.available,
      required this.img,
      this.isFavorite = false});
}
