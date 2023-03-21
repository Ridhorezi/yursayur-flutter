import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

import 'package:yursayur/model/ad_banner.dart';
import 'package:yursayur/model/category.dart';
import 'package:yursayur/model/product.dart';
import 'package:yursayur/route/app_page.dart';
import 'package:yursayur/route/app_route.dart';
import 'package:yursayur/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // register adapters
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  
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
