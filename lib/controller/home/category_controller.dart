import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/models/category_model.dart';

class CategoryController {
  final supabase = Supabase.instance.client;

  static const String _cacheKey = 'cached_categories';

  /// يحاول جلب التصنيفات من قاعدة البيانات (Supabase).
  /// عند النجاح: يحفظ نسخة محلية جديدة.
  /// عند الفشل (بدون إنترنت): يعيد آخر نسخة محفوظة محلياً بدل رمي خطأ.

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await supabase.from('categories').select();
      final categories = response
          .map((item) => CategoryModel.fromJson(item))
          .toList();

      await _cacheCategories(categories);
      return categories;
    } catch (e) {
      // لا يوجد اتصال أو حدث خطأ في الشبكة -> استخدم آخر نسخة محفوظة
      return _loadCachedCategories();
    }
  }

  /// يعيد آخر نسخة محفوظة محلياً فوراً (بدون أي انتظار للشبكة).
  /// تُستخدم لعرض الحاويات فور فتح الشاشة حتى قبل محاولة الاتصال بالإنترنت.
  Future<List<CategoryModel>> loadCachedCategories() {
    return _loadCachedCategories();
  }

  Future<void> _cacheCategories(List<CategoryModel> categories) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = categories.map((c) => c.toJson()).toList();
    await prefs.setString(_cacheKey, jsonEncode(jsonList));
  }

  Future<List<CategoryModel>> _loadCachedCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_cacheKey);
    if (jsonString == null) return [];

    final List<Map<String, dynamic>> decoded = jsonDecode(jsonString);
    return decoded
        .map((item) => CategoryModel.fromJson(item))
        .toList();
  }
}
