import 'package:flutter/material.dart';

class SuggestionsManagementScreen extends StatefulWidget {
  const SuggestionsManagementScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionsManagementScreen> createState() => _SuggestionsManagementScreenState();
}

class _SuggestionsManagementScreenState extends State<SuggestionsManagementScreen> {
  // ✍️ عائلة الخط المعتمدة في المشروع
  final String myCustomFont = 'Cairo';

  final List<String> _tabs = [
    "ملاحظات الطلب",
    "اضافة منتج مخصص",
    "بحث عن متجر",
    "بحث عن منتج",
  ];

  int _selectedTabIndex = 1; // محدد على "اضافة منتج مخصص" لمطابقة الصورة
  bool _isSuggestionsEnabled = true;

  @override
  Widget build(BuildContext context) {
    // 🎨 الألوان الدقيقة المسحوبة من تطبيقك لتوحيد التصميم
    const Color primaryColor = Color(0xffD62448); // اللون الأحمر القاني للـ AppBar والتبويب النشط
    const Color appBarBgColor = Color(0xffD62448);

    return Directionality(
        textDirection: TextDirection.rtl, // دعم الاتجاه العربي الصحيح
        child: Scaffold(
            backgroundColor: appBarBgColor, // جعل خلفية السقالة نفس لون الـ AppBar لتظهر الحواف الدائرية بشكل مثالي
            appBar: AppBar(
              backgroundColor: appBarBgColor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'ادارة الاقتراحات',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  fontFamily: myCustomFont,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.share_outlined, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),

            // 1. الحواف العلوية لجسم الصفحة (تأخذ انحناء دائري لتدخل في الـ AppBar الأحمر)
            body: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white, // خلفية محتوى الصفحة بيضاء نقية
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                    children: [
                // 2. شريط التبويبات الأفقي يقع مباشرة تحت الانحناء
                Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: SizedBox(
                    height: 45,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _tabs.length,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, index) {
                          bool isSelected = _selectedTabIndex == index;
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedTabIndex = index;
                                });
                              },
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: const EdgeInsets.symmetric(horizontal: 6),
                                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected ? primaryColor : const Color(0xffF1F1F1), // تبويب غير نشط رمادي خفيف جداً ليتناسق مع مشروعك
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                      child: Text(_tabs[index],
                                        style: TextStyle(
                                          color: isSelected ? Colors.white : const Color(0xff4A4A4A),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontFamily: myCustomFont,
                                        ),
                                      ),
                                  ),
                              ),
                          );
                        },
                    ),
                ),
            ),

            // 3. المحتوى الأوسط (أيقونة التقويم والنصوص الشاغرة)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.06), // دائرة وردية خفيفة جداً حول الأيقونة
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.calendar_today_outlined,
                      size: 55,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'لا توجد اقتراحات حالياً',
                    style: TextStyle(
                      color: const Color(0xff1A1C24),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: myCustomFont,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'الاقترحات الجديدة ستظهر هنا',
                    style: TextStyle(
                      color: const Color(0xff8A8D99),
                      fontSize: 14,
                      fontFamily: myCustomFont,
                    ),
                  ),
                ],
              ),
            ),

            // 4. الجزء السفلي (مربع تفعيل الاقتراحات - السويتش يسار والنصوص يمين محاذاة 100%)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xffF2F3F5), // لون المربع الداخلي أغمق بقليل ليتضح بروزه عن الخلفية البيضاء
                          borderRadius: BorderRadius.circular(20), // حواف دائرية للمربع
                        ),
                        child: Row(
                          children: [
                            // 1. النصوص أولاً: لتظهر في جهة اليمين تماماً في نظام الـ RTL
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // محاذاة أسطر النصوص إلى اليمين
                                children: [
                                  Text('تفعيل الاقتراحات',
                                    style: TextStyle(
                                      color: const Color(0xff1A1C24),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      fontFamily: myCustomFont,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'عند التفعيل، ستظهر الاقتراحات اثناء الكتابة',
                                    style: TextStyle(
                                      color: const Color(0xff8A8D99),
                                      fontSize: 12,
                                      fontFamily: myCustomFont,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 12), // مسافة فاصلة بين النص والزر

                            // 2. الـ Switch ثانياً: ليندفع تلقائياً إلى جهة اليسار في نظام الـ RTL
                            Transform.scale(
                              scale: 0.85,
                              child: Switch(
                                value: _isSuggestionsEnabled,
                                activeColor: const Color(0xffE91E4F), // الدائرة باللون الوردي الغامق
                                activeTrackColor: const Color(0xffF692A6), // الخلفية باللون الوردي الفاتح
                                inactiveTrackColor: Colors.black12,
                                onChanged: (value) {
                                  setState(() {
                                    _isSuggestionsEnabled = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                ),
            ),
        ),
    );
  }
}