import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../presentation/ui/screens/splash_screen.dart';
import '../presentation/ui/utility/app_colors.dart';
import './state_holder_binder.dart';

class CraftBay extends StatefulWidget {
  static final GlobalKey<NavigatorState> globalKey =
      GlobalKey<NavigatorState>();
  const CraftBay({super.key});

  @override
  State<CraftBay> createState() => _CraftBayState();
}

class _CraftBayState extends State<CraftBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftBay.globalKey,
      initialBinding: StateHolderBinder(),
      title: 'CraftBay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          AppColor.primaryColor.value,
          AppColor().color,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
