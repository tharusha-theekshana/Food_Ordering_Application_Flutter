import 'menu_entity.dart';

class Category {
  final String categoryId;
  final String menuCategoryId;
  final String menuId;
  final String storeId;
  final String title;
  final String subTitle;
  final List<MenuEntity> menuEntities;

  Category(
      {required this.categoryId,
      required this.menuCategoryId,
      required this.menuId,
      required this.storeId,
      required this.title,
      required this.subTitle,
      required this.menuEntities});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json["ID"],
      menuCategoryId: json["MenuCategoryID"],
      menuId: json["MenuID"],
      storeId: json["StoreID"],
      title: json["Title"]["en"],
      subTitle: json["SubTitle"]["en"] ?? "",
      menuEntities: (json['MenuEntities'] as List<dynamic>)
          .map((e) => MenuEntity.fromJson(e))
          .toList(),
    );
  }
}
