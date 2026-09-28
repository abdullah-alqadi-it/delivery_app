import 'package:delivery_app/core/constant/app_colors.dart';
//import 'package:delivery_app/core/constant/app_constants.dart';
import 'package:delivery_app/core/shared/continer_meas.dart';
//import 'package:delivery_app/core/shared/continer_sliverAppBer.dart';
import 'package:delivery_app/core/shared/custom_iconbutton.dart';
import 'package:delivery_app/data/models/restaurant_model.dart';
//import 'package:lottie/lottie.dart';

import 'package:delivery_app/view/widgets/home/restaurant_card.dart';
import 'package:delivery_app/view/widgets/profile/continer_sliverappber.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/controller/home/home_controller.dart';
import 'package:lottie/lottie.dart';

class MealsRestarant extends StatefulWidget {
  final RestaurantModel restaurant;
  final Widget Function(double)? buildStars;
  // final String name_reastarnt;
  // final String location;
  // final double rating;
  const MealsRestarant({
    super.key,
    // required this.name_reastarnt,
    // required this.rating,
    // required this.location, 
    this.buildStars, 
    required this.restaurant,  
  });

  @override
  State<MealsRestarant> createState() => _MealsRestarantState();
}

class _MealsRestarantState extends State<MealsRestarant> {
  List<RestaurantModel> restaurants = [];

  @override
  void initState() {
    super.initState();

    restaurants = HomeController().getRestaurants;
  }

  @override
  Widget build(BuildContext context) {
    final restarntname = widget.restaurant.name; 
    final restarntadress = widget.restaurant.address; 
    final restarntRating = widget.restaurant.rating; 
    final meals = widget.restaurant.meals;
    return Scaffold(
      //backgroundColor: Color(0xAFFF004C),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,

            expandedHeight: 250,
            backgroundColor: const Color.fromARGB(255, 255, 1, 86),
            surfaceTintColor: Colors.pink,

            title: Text(
              "${restarntname}",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: AppColors.gray100),
            ),
            actions: [
              CustomIconButton(
                onPressed: () {},
                icon: Icons.search_outlined,
                size: 18,
              ),
              CustomIconButton(
                onPressed: () {},
                icon: Icons.shopping_cart_sharp,
                size: 18,
              ),
              CustomIconButton(
                onPressed: () {},
                icon: Icons.ios_share,
                size: 18,
              ),
              CustomIconButton(onPressed: () {}, icon: Icons.person, size: 18),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color(0xAFFF004C),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 100, bottom: 10),
                        alignment: Alignment.center,
                        width: 350,
                        height: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.white.withValues(alpha: 0.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "عدد \nالتقيمات\n(${restarntRating})",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: AppColors.gray100),
                              textAlign: TextAlign.center,
                            ),
                           if(widget.buildStars!= null)
                           widget.buildStars!(restarntRating),
                            VerticalDivider(
                              color: AppColors.gray100.withValues(alpha: 0.2),
                              thickness: 3,
                              indent: 14,
                              endIndent: 14,
                            ),
                            Text(
                              "الاسعار مطابقه للمطعم",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: AppColors.gray100),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 0, bottom: 5),
                        alignment: Alignment.center,
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white.withValues(alpha: 0.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              minWidth: 170,
                              height: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delivery_dining_outlined,
                                    color: AppColors.gray100,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "توصيل",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppColors.gray100),
                                  ),
                                ],
                              ),
                              color: AppColors.orang,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: AppColors.white,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "استلام بنفسك",
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ContinerSliverappber(
                        widget: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.gray100,
                        ),
                        label: restarntadress,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.gray100,
                        ),
                        color_CircleAv: AppColors.white.withValues(alpha: 0.2),
                        color_contine: AppColors.gray100.withValues(alpha: 0.2),
                        size_height: 40,
                        size_wight: 350,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 2. الجزء المنحني (البطاقة البيضاء التي تحتوي أوقات الدوام)
          SliverPersistentHeader(
            pinned: true,
            delegate: MyHeaderDelegate(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    color: Color.fromARGB(
                      255,
                      255,
                      0,
                      81,
                    ), // خلفية حمراء لتظهر خلف الانحناء
                    child: Stack(
                      children: [
                        Container(
                          height: 120,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 25),
                            SizedBox(height: 35),
                            Icon(Icons.access_time),
                            SizedBox(width: 5),
                            Text(
                              " الطلب قد يستغرق 40 الى 55 دقيقة",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: AppColors.black),
                            ),
                          ],
                        ),

                        Positioned(
                          top: 0,
                          left: 0,
                          right: 295,
                          bottom: 75,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "مفتوح",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: AppColors.white),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomRight: Radius.circular(40),
                              ),

                              color: AppColors.amber200,
                            ),
                            width: 80,
                            height: 40,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ContinerMeasl(
                                      name_meals: "المفضله",
                                      child: Icon(
                                        Icons.favorite,
                                        color: AppColors.red100,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    ContinerMeasl(
                                      name_meals: "الاكثر طلبا",
                                      child: Lottie.asset(
                                        "assets/anmation/Fire.json",
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    ContinerMeasl(
                                      name_meals: "الاكثر طلبا",
                                      child: Image.asset(
                                        "assets/images/a.jpg",
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),

                                    SizedBox(width: 12),
                                    ContinerMeasl(
                                      name_meals: "المقبلات",
                                      child: Image.asset(
                                        "assets/images/d.jpg",
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    ContinerMeasl(
                                      name_meals: "قسم اللحوم",
                                      child: Image.asset(
                                        "assets/images/s.jpg",
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    ContinerMeasl(
                                      name_meals: "قسم اللحوم",
                                      child: Image.asset(
                                        "assets/images/d.jpg",
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    ContinerMeasl(
                                      name_meals: "قسم اللحوم",
                                      child: Image.asset(
                                        "assets/images/d.jpg",
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    ContinerMeasl(
                                      name_meals: "قسم اللحوم",
                                      child: Image.asset(
                                        "assets/images/h.jpg",
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ContinerSliverappber(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  size_wight: 400,

                  size_height: 55,

                  widget: Icon(Icons.favorite, color: AppColors.red100),
                  label: "المفضله",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: AppColors.black),
                  color_contine: AppColors.white,
                  color_CircleAv: AppColors.red500.withValues(alpha: 0.2),
                  shadow: [BoxShadow(color: AppColors.gray400, blurRadius: 2)],
                  borderRadius: BorderRadius.circular(16),
                ),
                SizedBox(height: 20),
                Text(
                  "الايوجد منتجات في هذاالتصنيف",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 20),
                ContinerSliverappber(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  size_wight: 400,

                  size_height: 55,

                  widget: Lottie.asset("assets/anmation/Fire.json"),
                  label: "الاكثر طلبا",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: AppColors.black),
                  color_contine: AppColors.white,
                  color_CircleAv: AppColors.red500.withValues(alpha: 0.2),
                  shadow: [BoxShadow(color: AppColors.gray400, blurRadius: 2)],
                  borderRadius: BorderRadius.circular(16),
                ),
              ],
            ),
          ),

          
  SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, index) {
      // جلب الوجبة الحالية مباشرة
      final meal = meals[index];

      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(blurRadius: 4, color: Colors.grey),
                  ],
                ),
                child: ListTile(
                                minLeadingWidth: 0,
                                contentPadding: EdgeInsets.zero,
                                trailing: SizedBox(
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [],
                                  ),
                                ),
                                //   leading: ,
                                title: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 100.0,
                                    bottom: 40,
                                  ),
                                  child: Center(
                                    child: Text(
                                      meal.name!,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            insetPadding: EdgeInsets.all(10),
                                            child: Container(
                                              width: double.infinity,
                                              height: 400,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Image.asset(
                                                      meal.image!,

                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(10),
                                                  ),
                                                  Text(
                                                    meal.name!,
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Image.asset(
                                      meal.image!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: AppColors.red300,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),

                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                         meal.isFavorite =
                                              !meal.isFavorite!;
                                        });
                                      },
                                      icon: meal.isFavorite!
                                          ? Icon(
                                              Icons.favorite_border_rounded,
                                              color: AppColors.white,
                                            )
                                          : Icon(
                                              Icons.favorite_outlined,
                                              color: AppColors.white,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              child: Text(
                                "  ريال ${meal.price}  ",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: SizedBox(
                                height: 40,
                                width: 100,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    // إذا لديه خيارات
                                    if (meal.option.isNotEmpty) {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (_) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "الخيارت المتوفرة",
                                                  style: Theme.of(
                                                    context,
                                                  ).textTheme.titleLarge,
                                                ),
                                                Divider(),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: meal.option.map((
                                                    option,
                                                  ) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            10,
                                                          ),
                                                      child: Column(
                                                        //trailing: Text(toElement.options[index].option_name),
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "${option.name}",
                                                                style: Theme.of(
                                                                  context,
                                                                ).textTheme.bodyLarge,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width: 60,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            15,
                                                                          ),
                                                                      color: AppColors
                                                                          .white,
                                                                    ),
                                                                    child: Text(
                                                                      "${option.price}",
                                                                      style: Theme.of(
                                                                        context,
                                                                      ).textTheme.bodyLarge,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  MaterialButton(
                                                                    onPressed:
                                                                        () {},
                                                                    child: Text(
                                                                      "اضافه لسلة",
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .bodyLarge!
                                                                          .copyWith(
                                                                            color:
                                                                                AppColors.white,
                                                                          ),
                                                                    ),
                                                                    color: AppColors
                                                                        .amber100,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            20,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      // إضافة مباشرة
                                    }
                                  },
                                  color: meal.option.isEmpty
                                      ? AppColors.amber100
                                      : AppColors.amber100,
                                  child: meal.option.isEmpty
                                      ? Text(
                                          "اضف لسله",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.white,
                                          ),
                                        )
                                      : Text(
                                          "عرض الخيارات",
                                          style: Theme.of(
                                             context,
                                            ).textTheme.labelMedium,
                                            
                                          
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  
                
              },

              childCount: meals.length,
              // عدد الوجبات
            ),
          ),
        ],
      ),
    );
  }
  
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  MyHeaderDelegate({required this.child});

  @override
  double get minExtent => 140;

  @override
  double get maxExtent => 140;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
