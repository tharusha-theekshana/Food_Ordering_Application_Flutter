import 'package:food_order_app/models/menu/availability.dart';

class Menu{
  final String id;
  final String menuId;
  final String verticalId;
  final String storeId;
  final String title;
  final String subTitle;
  final String description;
  final Map<String, Availability> menuAvailability;
  final List<String> menuCategoryIds;

  Menu(
      {required this.id,
      required this.menuId,
      required this.verticalId,
      required this.storeId,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.menuAvailability,
      required this.menuCategoryIds});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['ID'],
      menuId: json['MenuID'],
      verticalId: json['VerticalID'],
      storeId: json['StoreID'],
      title: json['Title']['en'],
      subTitle: json['SubTitle'],
      description: json['Description'],
      menuAvailability: (json['MenuAvailability'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Availability.fromJson(value)),
      ),
      menuCategoryIds: List<String>.from(json['MenuCategoryIDs']),
    );
  }
}
