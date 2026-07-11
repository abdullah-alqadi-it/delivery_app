import 'package:flutter/material.dart';

class CallDetailsBottomSheet extends StatelessWidget {
  const CallDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),

          // 1. النص التوضيحي العلوي
          const Text(
            "يمكنك الاتصال باحد الارقام التالية:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 25),

          // 2. زر رقم الجوال (خلفية رمادية ونص أسود)
          InkWell(
            onTap: () {
              // لإجراء الاتصال لاحقاً
            },
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0), // لون رمادي فاتح
                borderRadius: BorderRadius.circular(12), // حواف دائرية متناسقة
              ),
              child: const Center(
                child: Text(
                  "730095976",
                  style: TextStyle(
                    color: Colors.black, // لون أسود صريح
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ),

          const SizedBox(height: 16),

          // 3. زر رجوع (خلفية وردية خفيفة ونص أحمر)
          InkWell(
            onTap: () {
              Navigator.pop(context); // إغلاق اللوحة السفلية والعودة
            },
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE), // لون وردي خفيف جداً متناسق مع الصورة
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "رجوع",
                  style: TextStyle(
                    color: Colors.red, // لون أحمر صريح
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}













