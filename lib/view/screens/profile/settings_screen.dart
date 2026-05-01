import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/profile/card_setting.dart';
import 'addresses_screen.dart';
import 'edit_account_screen2.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),

        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('إدارة الحساب', style: TextStyle(color: Colors.white)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, size: 26, color: Colors.white),
          ),
        ),

        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          children: [
            _buildLocationBadge(),

            CardSetting(
              icon: FontAwesomeIcons.user,
              title: "الحساب",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditAccountScreen2()),
                );
              },
            ),
            CardSetting(
              icon: FontAwesomeIcons.receipt,
              title: "طلباتي",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.card_membership_outlined,
              title: "الاشتراكات (توصيل برو)",
              onTap: () {},
            ),
            CardSetting(
              icon: FontAwesomeIcons.wallet,
              title: "رصيدي",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.location_on_outlined,
              title: "العناوين",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddressesPage()),
                );
              },
            ),
            CardSetting(
              icon: FontAwesomeIcons.city,
              title: "تغيير المدينة",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.mark_as_unread_outlined,
              title: "تواصل معنا",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.notes_outlined,
              title: "سياسة الخصوصية",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.share_outlined,
              title: "مشاركة التطبيق",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.play_circle_outline,
              title: "كيفية استخدام التطبيق",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.restart_alt,
              title: "تحديث بيانات التطبيق",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.dark_mode_outlined,
              title: "مظهر التطبيق",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.edit_notifications_outlined,
              title: "ادارة الاقتراحات",
              onTap: () {},
            ),
            CardSetting(
              icon: Icons.logout,
              title: "تسجيل الخروج",
              onTap: () {},
            ),

            _buildAdvancedSettingsSection(),

            const Text(
              "الاصدار: 2.0.39",
              style: TextStyle(color: Colors.white30, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Text(
              'تم التطوير بواسطة شلة الانس',
              style: TextStyle(color: Colors.white30, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationBadge() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF3E1B22),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.location_on, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          const Text(
            'المنطقة الحالية: صنعاء',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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

      // tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        'إعدادات متقدمة',
        style: TextStyle(
          color: Color(0xFFE53935),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      shape: Border.symmetric(horizontal: BorderSide(color: Color(0xFF403E3E))),

      trailing: AnimatedRotation(
        turns: _isExpanded ? 0.5 : 0,
        duration: const Duration(milliseconds: 300),
        child: const Icon(
          Icons.keyboard_arrow_down,
          color: Color(0xFFE53935),
          size: 26,
        ),
      ),

      children: [
        CardSetting(
          icon: Icons.delete_outline,
          title: "حذف الحساب",
          onTap: () {},
        ),
      ],
    );
  }
}
