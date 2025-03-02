import 'package:flutter/material.dart';
import 'package:food_order_app/controller/cart_controller.dart';
import 'package:food_order_app/utils/app_colors.dart';
import 'package:get/get.dart';

class ItemCountGroup extends StatelessWidget {
  ItemCountGroup({super.key});
  late double _deviceHeight, _deviceWidth;

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: ElevatedButton(
            onPressed: cartController.decrementItemCount,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: AppColors.grayColor,
              fixedSize: const Size(20, 30),
              padding: EdgeInsets.zero,
            ),
            child: const Icon(
              Icons.remove,
              size: 20, // Smaller icon size
              color: AppColors.greenColor,
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.04),
          child: Obx(() => Text(
                cartController.itemCount.value.toString(),
                style:
                    TextStyle(fontSize: _deviceHeight * 0.02, fontWeight: FontWeight.bold,color: AppColors.blackColor),
              )),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: ElevatedButton(
            onPressed: cartController.incrementItemCount,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: AppColors.grayColor,
              fixedSize: const Size(40, 50),
              padding: EdgeInsets.zero,
            ),
            child: const Icon(
              Icons.add,
              size: 20, // Adjust icon size for better fit
              color: AppColors.greenColor,
            ),
          ),
        ),
      ],
    );
  }
}
