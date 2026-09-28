import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Cairo',
      textTheme: TextTheme(
        // 1. Black (أثقل وزن)
        displayLarge: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        // 2. ExtraBold
        displayMedium: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
        // 3. Bold (العريض المعتاد)
        titleLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        // 4. SemiBold
        titleMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        // 5. Medium
        bodyLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        // 6. Regular (الخط العادي)
        bodyMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        // 7. Light
        bodySmall: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        // 8. ExtraLight (أخف وزن)
        labelSmall: TextStyle(fontWeight: FontWeight.w200, fontSize: 10),
      ),
    );
  }
}
