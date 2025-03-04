import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_order_app/models/menu_items/menu_item.dart';
import 'package:get/get.dart';

class MenuItemController extends GetxController {
  var isLoading = true.obs;

  // For expanded area
  var expandedIndex = (-1).obs;

  // For menu item selection
  var selectedIndex = (-1).obs;
  var selectedPriceIndex = (-1).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  // Return menu items according to menu entity id
  Future<List<MenuItem>> loadMenuItems(String entityId) async {
    try {
      isLoading(true);

      // Load JSON file asynchronously
      final String response = await rootBundle.loadString('assets/json/app_json.json');
      final data = json.decode(response);

      List<dynamic> menuItemJsonList = data['Result']['Items'];

      List<MenuItem> filteredMenuItem = menuItemJsonList
          .where((json) => json['MenuItemID'] == entityId)
          .map((json) => MenuItem.fromJson(json))
          .toList();

      return filteredMenuItem;

    } catch (e) {
      print('Error loading menu: $e');
      return [];

    } finally {
      isLoading(false);
    }
  }

  // Return menu items according to modifier id
  Future<List<MenuItem>> loadMenuItemsByModifiers(String modifierId) async {
    try {
      isLoading(true);

      // Load JSON file
      final String response = await rootBundle.loadString('assets/json/app_json.json');
      final data = json.decode(response);

      List<dynamic> menuItemJsonList = data['Result']['Items'];

      List<MenuItem> filteredMenuItem = menuItemJsonList
          .where((json) => json['MenuItemID'].toString() == modifierId.toString())
          .map((json) => MenuItem.fromJson(json))
          .toList();

      return filteredMenuItem;

    } catch (e) {
      print('Error loading menu: $e');
      return [];

    } finally {
      isLoading(false);
    }
  }

}
