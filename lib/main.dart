import 'package:flutter/material.dart';
import 'package:news_app_clean_arch_2703/config/theme/app_themes.dart';
import 'package:news_app_clean_arch_2703/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app_clean_arch_2703/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const DailyNews(),
    );
  }
}
