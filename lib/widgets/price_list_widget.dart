import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PriceListWidget extends StatelessWidget {
  final String deliveryPrice;
  final String pickUpPrice;
  final String tablePrice;

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
      height: _deviceHeight * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _priceWidget("Delivery price", deliveryPrice),
          _priceWidget("Pick up price", pickUpPrice),
          _priceWidget("Delivery price", deliveryPrice),
        ],
      ),
    );
  }

  Widget _priceWidget(String key, String value) {
    return Column(
      children: [
        Text(
          key,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: _deviceHeight * 0.015,
              color: AppColors.blackColor),
        ),
        const SizedBox(
          height: 5,
        ),
        Text("Rs : $value",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _deviceHeight * 0.016,
                color: AppColors.blackColor))
      ],
    );
  }
}
