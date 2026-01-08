class FoodItem {
  final String id;
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final double rating;
  final bool isFavorite;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.rating = 4.5,
    this.isFavorite = false,
  });
}
