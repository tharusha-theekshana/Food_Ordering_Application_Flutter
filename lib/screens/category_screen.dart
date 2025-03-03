import 'package:flutter/material.dart';
import 'package:food_order_app/controller/category_controller.dart';
import 'package:food_order_app/widgets/add_to_cart_widget.dart';
import 'package:food_order_app/widgets/item_count_group_widget.dart';
import 'package:food_order_app/widgets/menu_item_view_widget.dart';
import 'package:food_order_app/widgets/tag_text_widget.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_app_bar_widget.dart';

class CategoryScreen extends StatefulWidget {
  String menuTitle;
  String menuId;

  CategoryScreen({super.key, required this.menuTitle, required this.menuId});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final categoryController = Get.put(CategoryController());

  late double _deviceHeight, _deviceWidth;

  late final String menuTitle;
  late final String menuId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuTitle = widget.menuTitle;
    menuId = widget.menuId;
    categoryController.loadCategory(menuId);
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: CustomAppBarWidget(title: menuTitle),
        body: Stack(children: [_bodyWidgets(), _bottomWidgets()]));
  }

  Widget _bodyWidgets() {
    return SizedBox(
      width: _deviceWidth,
      child: Obx(() {
        // Categories in loading state
        if (categoryController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.greenColor,
          ));
        }

        // Categories are empty
        if (categoryController.categoryList.isEmpty) {
          return Center(
              child: Text(
            "No categories available",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.greenColor,
                fontSize: _deviceHeight * 0.018),
          ));
        }

        // Categories are loaded success
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // Item list
              child: ListView.builder(
                itemCount: categoryController.categoryList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var category = categoryController.categoryList[index];

                  return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: _deviceHeight * 0.02),
                    padding: EdgeInsets.symmetric(
                        horizontal: _deviceWidth * 0.04,
                        vertical: _deviceHeight * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _categoryTitle(category.title, category.categoryId),
                        SizedBox(height: _deviceHeight * 0.01),
                        TagTextWidget(
                            tagText: "CATEGORY",
                            backgroundColor: AppColors.yellowColor,
                            textColor: AppColors.whiteColor,
                            deviceHeight: _deviceHeight,
                            deviceWidth: _deviceWidth),
                        MenuItemView(menuEntity: category.menuEntities)
                      ],
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

  Widget _bottomWidgets() {
    return Positioned(
        width: _deviceWidth,
        bottom: 0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.02),
          color: AppColors.whiteColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: _deviceWidth * 0.04,
              ),
              ItemCountGroup(),
              SizedBox(
                width: _deviceWidth * 0.05,
              ),
              Expanded(child: AddToCartWidget()),
              SizedBox(
                width: _deviceWidth * 0.04,
              ),
            ],
          ),
        ));
  }

  Widget _categoryTitle(String title, String id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatTitle(title),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: _deviceHeight * 0.03,
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Text(
          formatTitle("Id : $id"),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: _deviceHeight * 0.01,
          ),
        ),
      ],
    );
  }

  String formatTitle(String text) {
    return text.toLowerCase().split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      }
      return word;
    }).join(' ');
  }
}
