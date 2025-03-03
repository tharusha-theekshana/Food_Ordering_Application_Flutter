import 'package:flutter/material.dart';
import 'package:food_order_app/utils/app_colors.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';

class AddToCartWidget extends StatelessWidget {
  AddToCartWidget({super.key});

  late double _deviceHeight, _deviceWidth;

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: _deviceWidth * 0.5,
      height: _deviceHeight * 0.06,
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Add to cart ",style: TextStyle(
            fontSize: _deviceHeight * 0.018,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700
          ),),
          const SizedBox(
            width: 5,
          ),
          Obx(() => Text(cartController.totalAmount.toString(),style: TextStyle(
              fontSize: _deviceHeight * 0.018,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700
          ),))
        ],
      ),
    );
  }
}
