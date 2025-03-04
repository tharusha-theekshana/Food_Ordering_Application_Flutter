import 'package:flutter/material.dart';
import 'package:food_order_app/controller/menu_item_controller.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class PriceListWidget extends StatelessWidget {
  final String deliveryPrice;
  final String pickUpPrice;
  final String tablePrice;

  final menuItemController = Get.put(MenuItemController());

  PriceListWidget(
      {required this.deliveryPrice,
      required this.pickUpPrice,
      required this.tablePrice});

  late double _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: _deviceWidth * 0.9,
      height: _deviceHeight * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _priceWidget("Delivery price", deliveryPrice,1)),
          Expanded(child: _priceWidget("Pick up price", pickUpPrice,2)),
          Expanded(child: _priceWidget("Delivery price", deliveryPrice,3)),
        ],
      ),
    );
  }

  Widget _priceWidget(String key, String value, int index) {
    return SizedBox(
      width: _deviceWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Ensures vertical alignment
        children: [
          SizedBox(
            width: _deviceWidth * 0.05,
          ),
          Obx(
                () => Radio<int>(
              value: index,
              groupValue: menuItemController.selectedPriceIndex.value,
              onChanged: (int? value) {
                if (value != null) {
                  menuItemController.selectedPriceIndex.value = value;
                }
              },
              fillColor: MaterialStateProperty.all(AppColors.greenColor),
            ),
          ),
          Expanded(
            child: Text(
              key,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: _deviceHeight * 0.017,
                color: AppColors.blackColor,
              ),
            ),
          ),
          Text(
            "Rs : $value",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _deviceHeight * 0.017,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(
            width: _deviceWidth * 0.1,
          ),
        ],
      ),
    );
  }
}
