import 'package:flutter/material.dart';
import '../../../core/shared/custom_button.dart'; // تأكد من مسار الزر المشترك
import '../../../core/shared/custom_bottom_sheet.dart'; // تأكد من مسار الحاوية المشتركة
import 'call_details_bottom_sheet.dart'; // استيراد اللوحة الثانية

class ContactUsBottomSheet extends StatelessWidget {
  const ContactUsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),

          // 1. الشعار العلوي للتطبيق
          Image.asset(
            'assets/icons/3.jpg',
            height: 90,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 35),

          // 2. زر خدمة العملاء وتس آب
          CustomButton(
            onPressed: () {
              // لربط الواتساب لاحقاً
            },
            label: "خدمة العملاء وتس آب",
            backgroundColor: const Color(0xFF4CAF50),
          ),

          const SizedBox(height: 16),

          // 3. زر اتصل بخدمة العملاء لفتح القائمة الثانية
          CustomButton(
            onPressed: () {
              Navigator.pop(context); // إغلاق اللوحة الأولى

              // فتح لوحة أرقام الاتصال المنفصلة
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => const CustomBottomSheet(
                  content: CallDetailsBottomSheet(),
                ),
              );
            },
            label: "اتصل بخدمة العملاء",
            backgroundColor: const Color(0xFFE0E0E0),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}













