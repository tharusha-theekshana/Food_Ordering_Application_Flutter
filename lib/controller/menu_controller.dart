import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/menu/menu.dart';

class MenuListController extends GetxController {
  var menuList = <Menu>[].obs;
  var isLoading = true.obs;

  // For expanded area
  var expandedIndex = (-1).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadMenu();
    super.onInit();
  }

  // Load all menus
  Future<void> loadMenu() async {
    try {
      isLoading(true);

      // Load json file
      final String response =
          await rootBundle.loadString('assets/json/app_json.json');
      final data = await json.decode(response);

      List<dynamic> menuJsonList = data['Result']['Menu'];

      // Set data
      menuList.value =
          menuJsonList.map((menuJson) => Menu.fromJson(menuJson)).toList();
    } catch (e) {
      print('Error loading menu: $e');
    } finally {
      isLoading(false);
    }
  }
}
