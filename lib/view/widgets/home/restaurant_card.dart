import 'package:flutter/material.dart';
import '../../../../data/models/restaurant_model.dart';

class RestaurantCard extends StatefulWidget {
  // final RestaurantModel restaurant;

  const RestaurantCard({super.key});

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          // لوغو المطعم وتقييمه
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: BoxBorder.fromBorderSide(
                    BorderSide(color: Colors.red),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  // image: DecorationImage(image: AssetImage("assets/images/chicken-cutlet.jpg"),
                  // fit: BoxFit.cover,)
                ),
                child: Image.asset(
                  "assets/images/chicken-cutlet.jpg",
                  width: 50,
                  height: 50,
                ),
              ),
              _buildStars(3),
            ],
          ),
          const SizedBox(width: 10),
          // تفاصيل المطعم
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "مطعم القلعة",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "شارع الخمسين جوار سما مول",
                  style: TextStyle(color: Colors.grey[700], fontSize: 11),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTag("توصيل برو", Icons.icecream_rounded),
                    const SizedBox(width: 5),
                    _buildTag("استلم بنفسك", Icons.incomplete_circle),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8192C),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'مغلق',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: const Color(0xFFE8192C),
                  size: 22,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// ClipRRect(
// borderRadius: BorderRadius.circular(10),
// child: Container(
// width: 70,
// height: 70,
// color: const Color(0xFFF5F5F5),
// child: widget.restaurant.imageUrl.isNotEmpty &&
// !widget.restaurant.imageUrl.startsWith('assets')
// ? Image.network(
// widget.restaurant.imageUrl,
// fit: BoxFit.cover,
// errorBuilder: (_, __, ___) => _buildPlaceholderLogo(),
// )
//     : _buildPlaceholderLogo(),
// ),
// ),

// Widget _buildPlaceholderLogo() {
//   return Center(
//     child: Text(
//       widget.restaurant.name.isNotEmpty
//           ? widget.restaurant.name[0]
//           : '?',
//       style: const TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: Color(0xFFE8192C),
//       ),
//     ),
//   );
// }

Widget _buildTag(String label, IconData con) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      color: Colors.grey[400],
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Icon(con, color: Colors.red),
        SizedBox(width: 3),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 9)),
      ],
    ),
  );
}

Widget _buildStars(double rating) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(5, (index) {
      if (index < rating.floor()) {
        return const Icon(Icons.star, color: Colors.amber, size: 15);
      } else if (index < rating && rating % 1 != 0) {
        return const Icon(Icons.star_half, color: Colors.amber, size: 15);
      } else {
        return const Icon(Icons.star_border, color: Colors.amber, size: 15);
      }
    }),
  );
}
