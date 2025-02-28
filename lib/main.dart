import 'package:flutter/material.dart';
import 'package:food_order_app/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Order App',
      debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
            useMaterial3: true,
            fontFamily: "Quicksand",
            splashFactory: NoSplash.splashFactory,
            colorScheme: const ColorScheme.dark()),
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: "Quicksand",
            splashFactory: NoSplash.splashFactory,
            colorScheme: const ColorScheme.light()),
      themeMode: ThemeMode.system,
      home: HomeScreen()
    );
  }
}

