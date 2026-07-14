import 'package:delivery_app/view/screens/profile/suggestion_management_screen.dart';
import 'package:flutter/material.dart';
import '../../../controller/profile/how_to_use_app_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/custom_bottom_sheet.dart';
import '../../widgets/profile/balance_bottom_sheet.dart';
import '../../widgets/profile/card_setting.dart';
import '../../widgets/profile/city_bottom_sheet.dart';
import '../orders/order_screen.dart';
import 'addresses_screen.dart';
import 'edit_account_screen2.dart';
import 'how_to_use_app_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isExpanded = false;
  final HowToUseAppController _controller = HowToUseAppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E0E2),

      appBar: AppBar(
        backgroundColor: AppColors.red400,
        centerTitle: true,
        title: Text('إدارة الحساب', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 26, color: AppColors.white),
        ),
        toolbarHeight: 65,
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        children: [
          _buildLocationBadge(),

          CardSetting(
            imagePath: 'assets/icons/user-line.png',
            title: "الحساب",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EditAccountScreen2()),
              );
            },
          ),

          CardSetting(
            imagePath: 'assets/icons/Order.png',
            title: "طلباتي",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => OrderScreen()),
              );
            },
          ),

          CardSetting(
            imagePath: 'assets/icons/Favorite.png',
            title: "الاشتراكات (توصيل برو)",
            onTap: () {},
          ),

          CardSetting(
            imagePath: 'assets/icons/wallet_icon.png',
            title: "رصيدي",
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) =>
                    CustomBottomSheet(content: BalanceBottomSheet()),
              );
            },
          ),

          CardSetting(
            imagePath: 'assets/icons/Location.png',
            title: "العناوين",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddressesScreen()),
              );
            },
          ),

          CardSetting(
            imagePath: 'assets/icons/map.png',
            title: "تغيير المدينة",
            onTap: () {
              CityBottomSheet.show(context);
            },
          ),

          CardSetting(
            imagePath: 'assets/icons/built-in-ticket-support.png',
            title: "تواصل معنا",
            onTap: () {},
          ),

          CardSetting(
            imagePath: 'assets/icons/Security.png',
            title: "سياسة الخصوصية",
            onTap: () {},
          ),

          CardSetting(
            imagePath: 'assets/icons/export.png',
            title: "مشاركة التطبيق",
            onTap: () {},
          ),

          CardSetting(
            imagePath: 'assets/icons/reels.png',
            title: "كيفية استخدام التطبيق",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      HowToUseAppScreen(listVideo: _controller.getVideosList),
                ),
              );
            },
          ),

          CardSetting(
            imagePath: 'assets/icons/refresh_right_square_icon.png',
            title: "تحديث بيانات التطبيق",
            onTap: () {},
          ),

          CardSetting(
            imagePath: 'assets/icons/Moon fill.png',
            title: "مظهر التطبيق",
            onTap: () {},
          ),

          CardSetting(
            imagePath: 'assets/icons/wallet_icon.png',
            title: "لغةالتطبيق",
            onTap: () {},
          ),

          CardSetting(
            imagePath: 'assets/icons/pages-management.png',
            title: "ادارة الاقتراحات",
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuggestionsManagementScreen(),
                  ),
                );

            },
          ),

          CardSetting(
            imagePath: 'assets/icons/Logout.png',
            title: "تسجيل الخروج",
            onTap: () {},
          ),

          _buildAdvancedSettingsSection(),

          Text(
            "الاصدار: 2.0.39",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            'تم التطوير بواسطة شلة الانس',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildLocationBadge() {
    return GestureDetector(
      onTap: () {
        CityBottomSheet.show(context);
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: Color(0xFFDFB5BD),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.location_on, color: AppColors.black, size: 18),
            const SizedBox(width: 8),
            Text(
              'المنطقة الحالية: صنعاء',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedSettingsSection() {
    // bool _isExpanded = false;
    return ExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },

      title: Text(
        'إعدادات متقدمة',
        style: TextStyle(
          color: AppColors.red400,
          fontSize: 18,
          // fontWeight: FontWeight.bold,
        ),
      ),

      shape: Border.symmetric(horizontal: BorderSide(color: Color(0xFF403E3E))),

      trailing: AnimatedRotation(
        turns: _isExpanded ? 0.5 : 0,
        duration: const Duration(milliseconds: 300),
        child: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.red400,
          size: 26,
        ),
      ),

      children: [
        CardSetting(
          imagePath: 'assets/icons/Trash.png',
          title: "حذف الحساب",
          onTap: () {},
        ),
      ],
    );
  }
}
