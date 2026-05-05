import 'package:flutter/material.dart';
import '../../../../data/models/restaurant_model.dart';
import 'restaurant_card.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key, required this.restaurants});

  final List<RestaurantModel> restaurants;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Divider(color: Colors.grey[800]),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return RestaurantCard(restaurant: restaurants[index]);
      },
    );
  }
}