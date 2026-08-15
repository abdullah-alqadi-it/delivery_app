class CategoryModel {
  final int id;
  final String iconActiveUrl;
  final String iconInactiveUrl;

  CategoryModel({
    required this.id,
    required this.iconActiveUrl,
    required this.iconInactiveUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      iconActiveUrl: json['iconActiveUrl'] as String? ?? '',
      iconInactiveUrl: json['iconInactiveUrl'] as String? ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'iconActiveUrl': iconActiveUrl,
      'iconInactiveUrl': iconInactiveUrl,
    };
  }
}
