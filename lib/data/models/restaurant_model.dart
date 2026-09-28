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
  final List<mealsRestarnt> meals;

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
    required this.meals,
  });
}

class mealsRestarnt {
  String? name;
  int? price;
  String? image;
  bool? isFavorite;
  final List<optional> option;
  mealsRestarnt({
    this.name,
    this.image,
    this.price,
    this.isFavorite,
    required this.option
    
  });

// ignore: empty_constructor_bodies
}
class optional {
  String name;
  int price;
  
  optional({
    required this.name,
    
   required this.price,
    
    
  });

// ignore: empty_constructor_bodies
}
