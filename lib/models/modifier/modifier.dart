import 'package:food_order_app/models/modifier/modifier_options.dart';

class Modifier {
  final String id;
  final String modifierGroupId;
  final String title;
  final String description;
  final String storeId;
  final String displayType;
  final Map<String, ModifierOptions>  modifierOptions;

  Modifier({
    required this.id,
    required this.modifierGroupId,
    required this.title,
    required this.description,
    required this.storeId,
    required this.displayType,
    required this.modifierOptions});

  factory Modifier.fromJson(Map<String, dynamic> json){
    return Modifier(id: json["ID"],
        modifierGroupId: json["ModifierGroupID"],
        title: json["Title"]["en"],
        description: json["Description"]["en"],
        storeId: json["StoreID"],
        displayType: json["DisplayType"],
        modifierOptions: (json['ModifierOptions'] as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, ModifierOptions.fromJson(value)),
        ),
    );
  }
}
