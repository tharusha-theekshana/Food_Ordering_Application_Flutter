import 'package:flutter/material.dart';
import 'package:food_order_app/screens/splash_screen.dart';
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
          colorScheme: const ColorScheme.dark(),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Quicksand",
          splashFactory: NoSplash.splashFactory,
          colorScheme: const ColorScheme.light(),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white), // Dark mode icons
          ),
        ),
        themeMode: ThemeMode.system,
        home: SplashScreen());
  }
}
