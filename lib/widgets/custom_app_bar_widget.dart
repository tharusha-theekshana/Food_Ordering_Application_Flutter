import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  late double _deviceHeight,_deviceWidth;
  final String? title;

  CustomAppBarWidget({this.title});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.greenColor,
      title: Text(title ?? "Food Order App",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
          fontSize: _deviceHeight * 0.03
      ),),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
