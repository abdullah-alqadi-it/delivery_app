import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:delivery_app/view/screens/home/home_screen.dart';
import 'core/constant/app_theme.dart';

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // تهيئة Supabase باستخدام الرابط والمفتاح الخاصين بمشروعك
  await Supabase.initialize(
    url: 'https://vfmgmnvhhaeydwythkko.supabase.co'.trim(),
    publishableKey: 'sb_publishable_Q47vDi85p4twUKQnf7M_3g__pReww-R'.trim(),
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'توصيل ون',
      theme: AppTheme.lightTheme,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      home: HomeScreen(),
    );
  }
}