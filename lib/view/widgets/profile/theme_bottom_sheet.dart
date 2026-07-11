import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          // Padding: مسافات أمان داخلية حتى لا تلتصق العناصر بحواف الشاشة
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            // mainAxisSize.min: تجعل اللوحة تأخذ مساحة على قدر محتواها فقط ولا ترتفع لأعلى الشاشة
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment.end: لترتيب العناصر وتبدأ من اليمين لأن واجهة التطبيق عربية
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // 1. العنوان العلوي (نص "مظهر التطبيق" + الأيقونة)
              Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // حاوية دائرية رمادية خفيفة خلف الأيقونة
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColors.gray100, // رمادي فاتح جداً
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.dark_mode, color: Color(0xFF1A237E), size: 22), // أيقونة المظهر
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "مظهر التطبيق",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:AppColors.black, // لون أسود صريح للعنوان
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 25),

              // 2. خيار: الوضع الفاتح (محاط بإطار وردي وعلامة صح لأنه النشط حالياً)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12), // حواف دائرية متناسقة
                  // رسم الإطار الخارجي باللون الوردي المعتمد في الصورة
                  border: Border.all(color: AppColors.red400, width: 1.5),
                ),
                child: Row(
                  children: [

                    // حاوية أيقونة الشمس
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.red50, // خلفية وردية خفيفة للشمس
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.wb_sunny_rounded, color: AppColors.red400),
                    ),

                    const SizedBox(width: 12),

                    const Text(
                      "الوضع الفاتح",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    const Spacer(), // يدفع النص والأيقونة لأقصى اليمين

                    // علامة الصح الوردية
                    const Icon(Icons.check_circle, color: AppColors.red400),
                  ],
                ),
              ),

              // 3. خيار: الوضع الداكن (غير نشط، إطار رمادي وبدون علامة صح)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.gray200, width: 1.5), // إطار رمادي خفيف
                ),
                child: Row(
                  children: [
                    // حاوية أيقونة الهلال
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.gray100, // خلفية رمادية
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.bedtime_rounded, color: AppColors.gray500),
                    ),

                    // SizedBox فارغ للحفاظ على توازن ومحاذاة النصوص مثل الزر العلوي
                    const SizedBox(width: 24),

                    const Text(
                      "الوضع الداكن",
                      style: TextStyle(fontSize: 16,color: AppColors.black),
                    ),

                    const Spacer(),
                    // علامة الصح
                    const Icon(Icons.circle_outlined, color: AppColors.black)

                    //const SizedBox(width: 12),
                  ],
                ),
              ),

              // 4. خيار: مطابق للنظام
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.gray200, width: 1.5),
                ),
                child: Row(
                  children: [
                    // حاوية أيقونة الهاتف
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.gray100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.phone_android_rounded, color: AppColors.gray500),
                    ),
                    const SizedBox(width: 24),
                    const Text(
                      "مطابق للنظام",
                      style: TextStyle(fontSize: 16,color: AppColors.black),
                    ),
                    const Spacer(),
                    // علامة الصح
                    const Icon(Icons.circle_outlined, color: AppColors.black),
                    //const SizedBox(width: 12),
                  ],
                ),
              ),

              const SizedBox(height: 20), // مسافة أمان نهائية أسفل اللوحة
            ],
          ),
        ));
  }
}















