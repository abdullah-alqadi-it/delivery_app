class RestaurantModel {
  final String id;
  final String name;
  final String address;
  final String category;
  final String imageUrl;
  final double rating;
  final bool isOpen;
  final bool isFavorite;
  final String categoryIcon;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.address,
    required this.category,
    required this.imageUrl,
    required this.rating,
    this.isOpen = false,
    this.isFavorite = false,
    this.categoryIcon = '',
  });
}
