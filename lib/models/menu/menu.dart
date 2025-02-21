import 'package:food_order_app/models/menu/availability.dart';

class MenuModel {
  final String id;
  final String menuId;
  final String verticalId;
  final String storeId;
  final String title;
  final String subTitle;
  final String description;
  final Map<String, AvailabilityModel> menuAvailability;
  final List<String> menuCategoryIds;

  MenuModel(
      {required this.id,
      required this.menuId,
      required this.verticalId,
      required this.storeId,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.menuAvailability,
      required this.menuCategoryIds});

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['ID'],
      menuId: json['MenuID'],
      verticalId: json['VerticalID'],
      storeId: json['StoreID'],
      title: json['Title']['en'],
      subTitle: json['SubTitle'],
      description: json['Description'],
      menuAvailability: (json['MenuAvailability'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, AvailabilityModel.fromJson(value)),
      ),
      menuCategoryIds: List<String>.from(json['MenuCategoryIDs']),
    );
  }
}
