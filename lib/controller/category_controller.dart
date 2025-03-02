import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_order_app/models/category/category.dart';
import 'package:get/get.dart';


class CategoryController extends GetxController {
  var categoryList = <Category>[].obs;
  var isLoading = true.obs;

  // For expanded area
  var expandedIndex = (-1).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> loadCategory(String menuId) async {
    try {
      isLoading(true);

      // Load JSON file
      final String response =
      await rootBundle.loadString('assets/json/app_json.json');
      final data = await json.decode(response);

      List<dynamic> categoryJsonList = data['Result']['Categories'];

      // Filter categories that match the  menuId
      List<Category> filteredCategories = categoryJsonList
          .where((categoryJson) => categoryJson['MenuID'] == menuId)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();

      categoryList.value = filteredCategories;
    } catch (e) {
      print('Error loading menu: $e');
    } finally {
      isLoading(false);
    }
  }
}
