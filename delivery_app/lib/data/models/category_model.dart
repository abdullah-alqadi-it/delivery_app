import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData iconPath;
  bool isSelected;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconPath,
    this.isSelected = false,
  });
}
