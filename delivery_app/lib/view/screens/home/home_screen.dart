import 'package:flutter/material.dart';
import '../../../controller/home/home_controller.dart';
import '../../../controller/home/notification_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/custom_iconbutton.dart';
import '../../../core/shared/rounded_body.dart';
import '../../widgets/home/banner_slider.dart';
import '../../widgets/home/category_item.dart';
import '../../widgets/home/restaurant_item.dart';
import '../profile/addresses_screen.dart';
import '../profile/settings_screen.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController();

    return Scaffold(
      backgroundColor: AppColors.red400,
      appBar: AppBar(
        backgroundColor: AppColors.red400,
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddressesScreen()),
            );
          },
          child: _buildHeader(),
        ),
        actions: [_buildHeaderActions(context)],
        toolbarHeight: 65,
      ),

      body: RoundedBody(
        borderRadius: 45,
        child: Column(
          children: [
            // 1. هذا الجزء سيبقى ثابتاً ولن يتحرك أبداً مع السحب
            _buildIsOpen(context),
            const SizedBox(height: 10),
            CategoryItem(),
            const SizedBox(height: 10),

            // 2. الجزء الذي يبدأ منه التمرير (البانر وما تحته)
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: NestedScrollView(
                  // لضمان عدم وجود مسافات بيضاء علوية
                  // padding: EdgeInsets.zero,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      // البانر: يختفي عند السحب للأعلى
                      SliverAppBar(
                        floating: true,
                        snap: true,
                        pinned: false,
                        automaticallyImplyLeading: false,
                        backgroundColor: AppColors.white,
                        expandedHeight: 230,
                        elevation: 0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: BannerSlider(banners: controller.getBanners),
                        ),
                      ),

                      // التبويبات: تلتصق في الأعلى بمجرد اختفاء البانر
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(
                          const TabBar(
                            indicatorColor: AppColors.red400,
                            labelColor: AppColors.black,
                            unselectedLabelColor: AppColors.gray300,
                            tabs: [
                              Tab(text: "الكل"),
                              Tab(text: "الأقرب"),
                              Tab(text: "الجديدة"),
                              Tab(text: "المفضلة"),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  // محتوى المطاعم: تمرير كامل دون توقف
                  body: TabBarView(
                    children: [
                      RestaurantItem(restaurants: controller.getRestaurants),
                      RestaurantItem(restaurants: controller.getRestaurants),
                      RestaurantItem(restaurants: controller.getRestaurants),
                      RestaurantItem(restaurants: controller.getRestaurants),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//=================================================

Row _buildHeaderActions(BuildContext ctx) {
  final NotificationController controller2 = NotificationController();
  return Row(
    children: [
      CustomIconButton(onPressed: () {}, icon: Icons.search),

      CustomIconButton(
        onPressed: () {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (_) => SettingsScreen()),
          );
        },
        icon: Icons.person_outline,
      ),

      Stack(
        children: [
          CustomIconButton(
            onPressed: () {
              Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (_) => NotificationsScreen(
                    notification: controller2.notifications,
                  ),
                ),
              );
            },
            icon: Icons.notifications_outlined,
          ),
          Positioned(
            left: 5,
            top: 0,
            child: CircleAvatar(
              backgroundColor: AppColors.amber100,
              radius: 10,
              child: Text(
                '1',
                style: TextStyle(fontSize: 12, color: AppColors.black),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
//=================================================

Widget _buildHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [
          Text(
            'توصيل ون',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 0.0),
            child: Text(
              'صنعاء',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),

      // السطر الثاني: العنوان مع أيقونة الموقع
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, size: 14, color: Colors.white),

          const SizedBox(width: 4),
          Text(
            'جوار مستشفى الصداقة',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          // const SizedBox(width: 4),
          Spacer(),
          Icon(Icons.expand_more, size: 16, color: AppColors.white),
        ],
      ),
    ],
  );
}
//=================================================

Widget _buildIsOpen(BuildContext ctx) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0, top: 0, left: 0),
    child: Row(
      children: [
        const Icon(Icons.circle, color: AppColors.amber100, size: 8),
        const SizedBox(width: 6),
        Text(
          'أوقات الدوام من7:30 الصباح وحتى 11 المساء',
          style: Theme.of(ctx).textTheme.bodyMedium,
        ),
        Spacer(),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            height: 38,
            width: 85,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.red600,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            child: const Text(
              'مغلق',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Container(child: null),
      ],
    ),
  );
}

//=================================================

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Container(color: AppColors.white, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
