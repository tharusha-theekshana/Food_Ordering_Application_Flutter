import 'package:flutter/material.dart';
import 'package:food_order_app/controller/menu_controller.dart';
import 'package:food_order_app/screens/category_screen.dart';
import 'package:food_order_app/utils/app_colors.dart';
import 'package:food_order_app/widgets/availability_days_tags_widget.dart';
import 'package:food_order_app/widgets/custom_app_bar_widget.dart';
import 'package:food_order_app/widgets/tag_text_widget.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late final menuController;
  late double _deviceHeight, _deviceWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuController = Get.put(MenuListController());
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    _deviceWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(appBar: CustomAppBarWidget(), body: _bodyWidgets());
  }

  Widget _bodyWidgets() {
    return Container(
      width: _deviceWidth,
      height: _deviceHeight,
      padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.035, vertical: _deviceHeight * 0.02),
      child: Obx(() {
        if (menuController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greenColor,
              ));
        }

        if (menuController.menuList.isEmpty) {
          return Center(
              child: Text(
                "No menus available",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.greenColor,
                    fontSize: _deviceHeight * 0.018),
              ));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
                child: Text("${menuController.menuList.length} Menus Available",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.greenColor
                  ),)),
            Expanded( // Wrap the ListView.builder inside Expanded
              child: ListView.builder(
                itemCount: menuController.menuList.length,
                itemBuilder: (context, index) {
                  var menu = menuController.menuList[index];

                  return GestureDetector(
                    onTap: () {
                      if (menuController.expandedIndex.value == index) {
                        menuController.expandedIndex.value = -1;
                      } else {
                        menuController.expandedIndex.value = index;
                      }
                    },
                    onDoubleTap: () {
                      Get.to(CategoryScreen(
                        menuId: menu.menuId,
                        menuTitle: menu.title,
                      ));
                    },
                    child: Container(
                      width: _deviceWidth,
                      margin: EdgeInsets.symmetric(vertical: _deviceHeight *
                          0.005),
                      padding: EdgeInsets.symmetric(
                          horizontal: _deviceWidth * 0.02,
                          vertical: _deviceHeight * 0.01),
                      decoration: BoxDecoration(
                        color: AppColors.grayColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: const Border(
                            left: BorderSide(
                                color: AppColors.greenColor, width: 4.0)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _menuImage(),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _menuTitle(menu.title, menu.id),
                                    const SizedBox(height: 10),
                                    TagTextWidget(tagText: "MENU",
                                        backgroundColor: AppColors.greenColor,
                                        textColor: AppColors.whiteColor,
                                        deviceHeight: _deviceHeight,
                                        deviceWidth: _deviceWidth)
                                  ],
                                ),
                              ),
                              Obx(() =>
                                  Icon(
                                    menuController.expandedIndex.value == index
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: AppColors.greenColor,
                                  )),
                            ],
                          ),
                          Obx(() {
                            return menuController.expandedIndex.value == index
                                ? AvailabilityDaysTagsWidget(
                                menuAvailability: menu.menuAvailability)
                                : SizedBox.shrink();
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  // Menu image
  Widget _menuImage() {
    return Container(
      width: _deviceWidth * 0.2,
      height: _deviceHeight * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: const DecorationImage(
              image: AssetImage("assets/images/menu_image.png"),
              fit: BoxFit.cover)),
    );
  }

  // Menu title
  Widget _menuTitle(String title, String id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _formatTitle(title),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _deviceHeight * 0.025,
              color: AppColors.blackColor
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Text(
          _formatTitle("Id : $id"),
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: _deviceHeight * 0.01,
              color: AppColors.blackColor
          ),
        ),
      ],
    );
  }


  // Format title
  String _formatTitle(String text) {
    return text.toLowerCase().split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      }
      return word;
    }).join(' ');
  }
}
