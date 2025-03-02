import 'package:flutter/material.dart';
import 'package:food_order_app/controller/menu_item_controller.dart';
import 'package:food_order_app/models/category/menu_entity.dart';
import 'package:food_order_app/models/menu_items/menu_item.dart';
import 'package:food_order_app/widgets/price_list_widget.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class MenuItemView extends StatefulWidget {
  final List<MenuEntity> menuEntity;

  MenuItemView({required this.menuEntity});

  @override
  State<MenuItemView> createState() => _MenuItemViewState();
}

class _MenuItemViewState extends State<MenuItemView> {
  late double _deviceHeight, _deviceWidth;
  late final MenuItemController menuItemController;

  @override
  void initState() {
    super.initState();
    menuItemController = Get.put(MenuItemController());
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 10, horizontal: _deviceWidth * 0.02),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.menuEntity.length,
        itemBuilder: (context, index) {
          return StreamBuilder<List<MenuItem>>(
            stream:
                menuItemController.loadMenuItems(widget.menuEntity[index].id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.greenColor),
                );
              }

              if (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return const Center(child: Text('No menu items available'));
              }

              List<MenuItem> menuItems = snapshot.data!;

              return GestureDetector(
                onTap: () {
                  if (menuItemController.expandedIndex.value == index) {
                    menuItemController.expandedIndex.value = -1;
                  } else {
                    menuItemController.expandedIndex.value = index;
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(menuItems.length, (itemIndex) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: _deviceHeight * 0.015,
                          horizontal: _deviceWidth * 0.05),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: _deviceWidth,
                      decoration: BoxDecoration(
                          color: AppColors.grayColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      menuItems[itemIndex].title,
                                      style: TextStyle(
                                        color: AppColors.greenColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: _deviceHeight * 0.017),
                                    ),
                                    SizedBox(
                                      height: _deviceHeight * 0.005,
                                    ),
                                    Text(
                                      menuItems[itemIndex].menuItemId,
                                      style: TextStyle(
                                          fontSize: _deviceHeight * 0.01,
                                          color:AppColors.blackColor
                                      ),
                                    ),
                                    SizedBox(
                                      height: _deviceHeight * 0.005,
                                    ),
                                    _tagText(),
                                  ],
                                ),
                              ),
                              Obx(() => Expanded(
                                    flex: 2,
                                    child: Icon(
                                      menuItemController.expandedIndex.value ==
                                              index
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: AppColors.greenColor,
                                    ),
                                  )),
                            ],
                          ),
                          Obx(() {
                            return menuItemController.expandedIndex.value ==
                                    index
                                ? _expandedArea(
                                    menuItems[itemIndex].description,
                                    menuItems[itemIndex].deliveryPrice,
                                    menuItems[itemIndex].pickUpPrice,
                                    menuItems[itemIndex].tablePrice)
                                : SizedBox.shrink();
                          }),
                        ],
                      ),
                    );
                  }),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _expandedArea(String description, String deliverPrice,
      String pickUpPrice, String tablePrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _deviceHeight * 0.01,
        ),
        Text(
          formatDescription(description),
          style: const TextStyle(fontWeight: FontWeight.w500,color:AppColors.blackColor),
        ),
        SizedBox(
          height: _deviceHeight * 0.02,
        ),
        PriceListWidget(
            deliveryPrice: deliverPrice,
            pickUpPrice: pickUpPrice,
            tablePrice: tablePrice)
      ],
    );
  }

  // MENUITEM tag
  Widget _tagText() {
    return Container(
      width: _deviceWidth * 0.13,
      padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.005),
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Text(
        "MENU ITEM",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 8.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Format Description text
  String formatDescription(String input) {
    input = input.replaceAll(RegExp(r'\band\b', caseSensitive: false), '');
    return input.split(',').map((item) => '•  ${item.trim()}').join('\n');
  }
}
