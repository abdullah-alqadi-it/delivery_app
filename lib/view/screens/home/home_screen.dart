import 'package:flutter/material.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/shared/custom_iconbutton.dart';
import '../../../core/shared/rounded_body.dart';
import '../../widgets/home/banner_slider.dart';
import '../../widgets/home/category_item.dart';
import '../../widgets/home/restaurant_card.dart';
import '../profile/addresses_screen.dart';
import '../profile/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeController _controller = HomeController();

    return Scaffold(
      backgroundColor: const Color(0xFFCC3252),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF31403),
        // backgroundColor: Colors.white,
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddressesPage()),
            );
          },
          child: _buildHeader(),
        ),
        actions: [_buildHeaderActions(context)],
      ),
      body: RoundedBody(
          child: Column(
            children: [
              // 1. الجزء الثابت تماماً (الحالة والتصنيفات)
              _buildIsOpen(),
              CategoryItem(),
              SizedBox(height: 5,),

              // 2. الجزء الذي يحتوي على التفاعل (البانر + التبويبات + القائمة)
              Expanded(
                child: DefaultTabController(
                  length: 4,
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // البانر: يختفي للأعلى ويظهر فوراً عند السحب للأسفل (Snap effect)
                      SliverAppBar(
                        floating: true, // يظهر بمجرد السحب للأسفل حتى لو لم تصل للقمة
                        snap: true,     // يظهر كاملاً بمجرد حركة بسيطة (1 بكسل كما قلت)
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.white,
                        expandedHeight: 230, // ارتفاع البانر
                        flexibleSpace: FlexibleSpaceBar(
                          background: BannerSlider(banners: _controller.getBanners),
                        ),
                      ),

                      // التبويبات: تثبت في الأعلى (Pinned)
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(
                          TabBar(
                            indicatorColor: Colors.redAccent,
                            labelColor: Colors.black,
                            tabs: [
                              Tab(text: "الكل"),
                              Tab(text: "الأقرب"),
                              Tab(text: "الجديدة"),
                              Tab(text: "المفضلة"),
                            ],
                          ),
                        ),
                      ),

                      // قائمة المطاعم
                      SliverFillRemaining(
                        // hasScrollBody: true,
                        child: TabBarView(
                          children: [
                            _buildRestaurantsList(),
                            _buildRestaurantsList(),
                            _buildRestaurantsList(),
                            _buildRestaurantsList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}

Row _buildHeaderActions(BuildContext ctx) {
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
            onPressed: () {},
            icon: Icons.notifications_outlined,
          ),
          Positioned(
            left: 5,
            top: 0,
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 10,
              child: Text(
                '1',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      // السطر الأول: اسم التطبيق
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'توصيل ون',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // أو اللون الأحمر الخاص بك
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
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.location_on, size: 14, color: Colors.white),

          const SizedBox(width: 4),
          Text(
            'جوار مستشفى الصداقة',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          // const SizedBox(width: 4),
          Spacer(),
          Icon(Icons.expand_more, size: 16, color: Colors.white),
        ],
      ),
    ],
  );
}

Widget _buildIsOpen() {
  return Padding(
    padding: const EdgeInsets.only(right: 25.0, top: 0, left: 2),
    child: Row(
      children: [
        const Icon(Icons.circle, color: Colors.amber, size: 8),
        const SizedBox(width: 6),
        const Text(
          'أوقات الدوام من7:30 الصباح وحتى 11 المساء',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        Spacer(),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            height: 35,
            width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFE8192C),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
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


Widget _buildRestaurantsList() {
  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(), // لأننا داخل SingleChildScrollView
    separatorBuilder: (context, index) => Divider(
      color: Colors.grey[800],
    ),
    itemCount: 20,
    itemBuilder: (context, index) => RestaurantCard(),
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}


