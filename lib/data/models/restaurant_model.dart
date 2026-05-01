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

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      category: json['category'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      isOpen: json['isOpen'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
      categoryIcon: json['categoryIcon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'category': category,
      'imageUrl': imageUrl,
      'rating': rating,
      'isOpen': isOpen,
      'isFavorite': isFavorite,
      'categoryIcon': categoryIcon,
    };
  }

  RestaurantModel copyWith({
    String? id,
    String? name,
    String? address,
    String? category,
    String? imageUrl,
    double? rating,
    bool? isOpen,
    bool? isFavorite,
    String? categoryIcon,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      isOpen: isOpen ?? this.isOpen,
      isFavorite: isFavorite ?? this.isFavorite,
      categoryIcon: categoryIcon ?? this.categoryIcon,
    );
  }
}
