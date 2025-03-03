import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_order_app/models/menu_items/menu_item.dart';
import 'package:get/get.dart';

class MenuItemController extends GetxController {
  var menuItemList = <MenuItem>[].obs;
  var isLoading = true.obs;

  // For expanded area
  var expandedIndex = (-1).obs;

  // For menu item selection
  var selectedIndex = (-1).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Stream<List<MenuItem>> loadMenuItems(String entityId) async* {
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

      yield filteredMenuItem; // Emit the list of menu items

    } catch (e) {
      print('Error loading menu: $e');
      yield []; // Emit an empty list on error
    } finally {
      isLoading(false);
    }
  }

}
