import 'package:flutter/material.dart';
import '../../../../data/models/restaurant_model.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.restaurant.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.restaurant.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.restaurant, size: 40),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text('216.61 كيلو',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 2),
              _buildStars(widget.restaurant.rating),
            ],
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.restaurant.name,
                    style: Theme.of(context).textTheme.bodyLarge
                ),
                Text(
                  widget.restaurant.address,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTag(
                        widget.restaurant.category,
                        Icons.restaurant_menu,
                      ),
                      const SizedBox(width: 5),
                      _buildTag("توصيل سريع", Icons.delivery_dining),

                      const SizedBox(width: 5),
                      _buildTag("توصيل برو", Icons.delivery_dining),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: widget.restaurant.isOpen
                      ? Colors.green
                      : const Color(0xFFE8192C),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  widget.restaurant.isOpen ? 'مفتوح' : 'مغلق',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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

  // دالة بناء التاجات
  Widget _buildTag(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFE8192C), size: 12),
          const SizedBox(width: 3),
          Text(
            label,
            style: const TextStyle(color: Colors.black87, fontSize: 9),
          ),
        ],
      ),
    );
  }

  // دالة بناء النجوم
  Widget _buildStars(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star, color: Colors.amber, size: 12);
        } else if (index < rating && rating % 1 != 0) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 12);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 12);
        }
      }),
    );
  }
}
