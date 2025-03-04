import 'package:flutter/material.dart';
import 'package:food_order_app/screens/menu_screen.dart';
import '../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double _deviceHeight, _deviceWidth;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {

      // Check context is mounted
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MenuScreen()), // Replace with your next screen
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Food Order \nApp",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _deviceHeight * 0.05,
                fontWeight: FontWeight.bold,
                color: AppColors.greenColor
              ),
            ),
            SizedBox(height: _deviceHeight * 0.1),
            const SizedBox(
              width: 23.0,
              height: 23.0,
              child: CircularProgressIndicator(
                color: AppColors.greenColor,
                strokeWidth: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
