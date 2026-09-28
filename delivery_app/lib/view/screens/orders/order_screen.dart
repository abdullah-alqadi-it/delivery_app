import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../widgets/orders/My_Baskets_Widget.dart';
import '../../widgets/orders/My_Requests_Widget.dart';
import '../../widgets/orders/custom_tab_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {

  late TabController _topTabController;
  static const List<String> _tabTitles = ['طلباتي', 'سلاتي'];

  @override
  void initState() {
    super.initState();
    _topTabController = TabController(length: 2, vsync: this);

    _topTabController.addListener(() {
      // if (!_topTabController.indexIsChanging) {
        setState(() {});
      // }
    });
  }

  @override
  void dispose() {
    _topTabController.dispose();
    super.dispose();
  }

  String get _currentTitle => _tabTitles[_topTabController.index];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.red400,
        centerTitle: true,

        title: Text(
          _currentTitle,
          style: const TextStyle(color: AppColors.white, fontSize: 20),
        ),

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, size: 26, color: AppColors.white),
        ),
        // toolbarHeight: 65,

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(54),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CustomTabBar(
              controller: _topTabController,
              tabs: const [
                CustomTabItem(
                  label: 'طلباتي',
                  icon: Icons.receipt_long_outlined,
                ),
                CustomTabItem(
                  label: 'سلاتي',
                  icon: Icons.shopping_bag_outlined,
                ),
              ],
              selectedColor: AppColors.amber100,
              backgroundColor: AppColors.white18,
              selectedLabelColor: AppColors.white,
              unselectedLabelColor: AppColors.white70,
              borderColor: null, // بلا حدود
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ),
      ),

      // ══════════════════════════════════════════════
      body: TabBarView(
        controller: _topTabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // صفحة طلباتي
          MyRequestsWidget(),
          // صفحة سلاتي
          MyBasketsWidget(),
        ],
      ),
    );
  }
}
