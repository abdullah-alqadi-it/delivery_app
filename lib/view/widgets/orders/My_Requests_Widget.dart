import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import 'custom_tab_bar.dart';

class MyRequestsWidget extends StatelessWidget {
  const MyRequestsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const SizedBox(height: 14),

          // زر فلتر "الكل"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: AllFilterButton(
                orangeColor: AppColors.amber100,
                redColor: AppColors.red400,
              ),
            ),
          ),

          const SizedBox(height: 12),

          CustomTabBar(
            tabs: const [
              CustomTabItem(label: 'الكل'),
              CustomTabItem(label: 'توصيل', icon: Icons.delivery_dining),
              CustomTabItem(label: 'استلم بنفسك', icon: Icons.delivery_dining),
            ],
            borderColor: AppColors.amber100,
          ),

          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Text(
                    'لا يوجد طلبات',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// زر فلتر "الكل"
// ══════════════════════════════════════════════════════

class AllFilterButton extends StatefulWidget {
  final Color orangeColor;
  final Color redColor;

  const AllFilterButton({
    super.key,
    required this.orangeColor,
    required this.redColor,
  });

  @override
  State<AllFilterButton> createState() => _AllFilterButtonState();
}

class _AllFilterButtonState extends State<AllFilterButton> {
  bool _isTapped = false;

  Future<void> _handleTap() async {
    if (_isTapped) return;
    setState(() => _isTapped = true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) setState(() => _isTapped = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: widget.orangeColor,
          borderRadius: BorderRadius.circular(70),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: _isTapped ? widget.orangeColor : AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: _isTapped ? widget.redColor : Colors.transparent,
                  width: 4,
                ),
              ),
              child: const Icon(
                Icons.fastfood_rounded,
                color: AppColors.amber100,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('الكل', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}
