import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // نرجع الـ Dialog مباشرة كـ Widget مستقل
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // الحواف الدائرية
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ليأخذ مساحة المحتوى فقط
          children: [
            const SizedBox(height: 10),

            // 1. الأيقونة
            const Icon(
              Icons.sentiment_satisfied_alt_rounded,
              color: AppColors.red400,
              size: 80,
            ),

            const SizedBox(height: 20),

            // 2. نص السؤال
            const Text(
              "هل انت متأكد من تسجيل الخروج؟",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.gray600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            // 3. الأزرار (لا و نعم)
            Row(
              children: [
                // زر لا
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.red400, width: 1.5),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // إغلاق النافذة
                    },
                    child: const Text(
                      "لا",
                      style: TextStyle(
                        color: AppColors.red400,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // زر نعم
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red400,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // إغلاق النافذة حالياً
                    },
                    child: const Text(
                      "نعم",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}















