import 'package:flutter/material.dart';
import '../../../../data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key});

  final List<String> categories = [
    "وصل لي",
    "مطاعم برو",
    "المطاعم",
    "عسل وتمور",
    "خضروات وفواكه",
    "استلم بنفسك",
    "الأسرع",
    "اللحوم",
    "سوبر ماركت",
    "مشاريع منزلية",
    "الحلويات",
    "شي إن",
    "المنظفات",
    "الإكسسوارات",
    "عطور وتجميل",
    "تحف وهدايا",
    "بهارات ومكسرات",
    "صيدليات",
    "ملابس",
    "إلكترونيات",
    "قرطاسيات",
  ];

  List<CategoryModel> cat = [
    CategoryModel(id: '1', name: 'كل التصنيفات', iconPath: Icons.menu),
    CategoryModel(id: '2', name: 'توصيل يُرو', iconPath: Icons.adb),
    CategoryModel(id: '3', name: 'وصل لي', iconPath: Icons.accessibility_new),
    CategoryModel(id: '4', name: 'استلم بنفسك', iconPath: Icons.ac_unit),
    CategoryModel(id: '5', name: 'خضروات', iconPath: Icons.vaccines_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          // المربع الثابت "كل التصنيفات"
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // عدد الأعمدة
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: cat.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Icon(cat[index].iconPath),
                                SizedBox(height: 2),
                                Text(
                                  cat[index].name,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              // width: 115, // ثابت
              // margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                // border: BoxBorder.all(width: 2,color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text("كل التصنيفات"),
                  Icon(Icons.grid_view_outlined, color: Colors.red),
                ],
              ),
            ),
          ),

          SizedBox(width: 4),
          // باقي التصنيفات في شريط أفقي قابل للسحب
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cat.length,
              // separatorBuilder: (context, index) => SizedBox(width: 8),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(10),
                  // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(cat[index].iconPath),
                        SizedBox(height: 2),
                        SizedBox(height: 2),
                        Text(cat[index].name),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
