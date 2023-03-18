import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yursayur/route/app_page.dart';
import 'package:yursayur/route/app_route.dart';
import 'package:yursayur/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
