import 'package:flutter/material.dart';
import '../../../controller/home/category_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../data/models/category_model.dart';
import 'category_item_widget.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({super.key});

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  final CategoryController categoryController = CategoryController();
  final ScrollController _horizontalScrollController = ScrollController();
  int selectedCategoryId = 1; // القسم المحدد افتراضياً
  final double _itemWidth = 95.0;

  // قائمة التصنيفات الحالية المعروضة على الشاشة
  List<CategoryModel> _categories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  // يعرض أولاً آخر نسخة محفوظة محلياً فوراً (بدون انتظار الشبكة)،
  // ثم يحاول تحديثها من الإنترنت في الخلفية دون أي مؤشر تحميل أو خطأ.
  Future<void> _loadCategories() async {
    final cached = await categoryController.loadCachedCategories();
    if (mounted && cached.isNotEmpty) {
      setState(() => _categories = cached);
    }

    final fresh = await categoryController.fetchCategories();
    if (mounted && fresh.isNotEmpty) {
      setState(() => _categories = fresh);
    }
  }

  // دالة التمرير التلقائي الذكي لوسط الشاشة
  void _scrollToSelectedCategory(int index) {
    if (_horizontalScrollController.hasClients) {
      double screenWidth = MediaQuery.of(context).size.width;
      double targetOffset =
          (index * _itemWidth) - (screenWidth / 2) + (_itemWidth / 2) + 40 ;

      double maxScroll = _horizontalScrollController.position.maxScrollExtent;
      double minScroll = _horizontalScrollController.position.minScrollExtent;
      targetOffset = targetOffset.clamp(minScroll, maxScroll);

      _horizontalScrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  // نافذة كل التصنيفات (Dialog)
  void _showAllCategoriesDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: AppColors.white,
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 50,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'كل التصنيفات',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Expanded(
                      child: GridView.builder(
                        itemCount: _categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                        itemBuilder: (context, index) {
                          final category = _categories[index];
                          final isSelected = category.id == selectedCategoryId;
                          return CategoryItemWidget(
                            category: category,
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                selectedCategoryId = category.id;
                              });
                              Navigator.pop(context);
                              _scrollToSelectedCategory(index);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        // منطقة شريط التصنيفات العائم والمتحرك
        SizedBox(
          height: 75,
          child: Stack(
            children: [
              Positioned.fill(
                child: ListView.separated(
                  separatorBuilder: (_, i) => const SizedBox(width: 10),
                  controller: _horizontalScrollController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 90, left: 12),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    final isSelected = category.id == selectedCategoryId;
                    return CategoryItemWidget(
                      category: category,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedCategoryId = category.id;
                        });
                      },
                    );
                  },
                ),
              ),

              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: _showAllCategoriesDialog,
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/icons/all_categories.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
