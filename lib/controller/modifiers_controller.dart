import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:food_order_app/models/modifier/modifier_group.dart';
import 'package:get/get.dart';

class ModifiersController extends GetxController {
  var isLoading = true.obs;

  // For menu item selection
  var selectedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<Modifier>> loadModifiers(String modifierId) async {
    try {
      isLoading(true);

      // Load JSON file
      final String response =
      await rootBundle.loadString('assets/json/app_json.json');
      final data = json.decode(response);

      List<dynamic> modifierJsonList = data['Result']['ModifierGroups'];

      // Filter modifiers by `ModifierGroupID`
      List<Modifier> filteredModifiers = modifierJsonList
          .where((json) => json['ModifierGroupID'].toString() == modifierId)
          .map((json) => Modifier.fromJson(json))
          .toList();

      return filteredModifiers;

    } catch (e) {
      print('Error loading modifiers: $e');
      return [];

    } finally {
      isLoading(false);
    }
  }
}
