import 'package:flutter/material.dart';
import 'app_colors.dart';

// class AppTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       useMaterial3: true,
//       primaryColor: AppColors.primary,
//       scaffoldBackgroundColor: AppColors.background,
//
//       // إعدادات ألوان النصوص (Text Theme)
//       textTheme: const TextTheme(
//         displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
//         bodyLarge: TextStyle(fontSize: 16, color: AppColors.textPrimary),
//         bodyMedium: TextStyle(fontSize: 14, color: AppColors.textSecondary),
//       ),
//
//       // إعدادات الأزرار (Button Theme)
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primary,
//           foregroundColor: AppColors.textLight,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//
//       // إعدادات الـ Card والـ Containers بشكل عام
//       cardTheme: CardThemeData(
//         color: AppColors.surface,
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//
//       // إعدادات حقول الإدخال (TextFields)
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppColors.surface,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: AppColors.textSecondary),
//         ),
//       ),
//     );
//   }
// }


class AppTheme {
  static ThemeData get tawseelTheme {
    return ThemeData(
      useMaterial3: true,
      // تأكد من إضافة خط Cairo في pubspec.yaml
      fontFamily: 'Cairo',

      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),

      // تنسيق النصوص الموحد (العناوين مثل صورتك حجم 23)
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
      ),

      // تنسيق الأزرار (مثل أزرار "توصيل ون" الحمراء العريضة)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50), // زر عريض
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),

      // تنسيق الـ AppBar (أحمر أو أبيض حسب ذوقك)
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


//===========================================================

    // return ThemeData(
      // 1. تحديد الخط العام لكل التطبيق
      // fontFamily: 'AppFont',

      // scaffoldBackgroundColor: kBackgroundColor,

      // 3. تعريف ثيم النصوص تلقائياً
      // textTheme: TextTheme(
      //   // العناوين الكبيرة (مثل "تفاصيل الطلب")
      //   displayLarge: TextStyle(
      //     fontSize: 23,
      //     fontWeight: FontWeight.bold,
      //     color: kSecondaryColor, // اللون من صورتك
      //   ),
      //   // النصوص العادية
      //   bodyLarge: TextStyle(
      //     fontSize: 18,
      //     color: kTextColor, // اللون من صورتك
      //   ),
      //   // النصوص الخفيفة أو الفرعية
      //   bodyMedium: TextStyle(
      //     fontSize: 14,
      //     color: kTextLightColor, // اللون من صورتك
      //   ),
      // ),
