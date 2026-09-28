import 'package:delivery_app/view/screens/home/meals_Restarant.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/restaurant_model.dart';
import 'restaurant_card.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key, this.restaurants, this.buildStars});

  final List<RestaurantModel>? restaurants;
  final Widget Function(double)? buildStars;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Divider(color: Colors.grey[800]),
      itemCount: restaurants?.length ?? 0,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MealsRestarant(
                  restaurant: restaurants![index],
                  // name_reastarnt: restaurants![index].name,
                  // location: restaurants![index].address,
                  // rating: restaurants![index].rating,
                  buildStars: buildStars,
                ),
              ),
            );
          },
          child: RestaurantCard(
            restaurant: restaurants![index],
            buildStars: buildStars,
          ),
        );
      },
    );
  }
}
