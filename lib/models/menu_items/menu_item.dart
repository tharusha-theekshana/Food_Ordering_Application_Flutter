class MenuItem {
  final String id;
  final String menuItemId;
  final String storeId;
  final String title;
  final String description;
  final String imageUrl;
  final String deliveryPrice;
  final String pickUpPrice;
  final String tablePrice;

  final bool isVegetarian;
  final bool isHalal;
  final List<dynamic> categoryIds;

  final String productId;
  final String productName;
  final String unitChartId;
  final String unitChartName;

  MenuItem({required this.id,
    required this.menuItemId,
    required this.storeId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.deliveryPrice,
    required this.pickUpPrice,
    required this.tablePrice,
    required this.isVegetarian,
    required this.isHalal,
    required this.categoryIds,
    required this.productId,
    required this.productName,
    required this.unitChartId,
    required this.unitChartName});

  factory MenuItem.fromJson(Map<String, dynamic> json){
    return MenuItem(id: json["ID"],
        menuItemId: json["MenuItemID"],
        storeId: json["StoreID"],
        title: json["Title"]["en"],
        description: json["Description"]["en"],
        imageUrl: json["ImageURL"],
        deliveryPrice: json["PriceInfo"]["Price"]["DeliveryPrice"].toString() ?? "0",
        pickUpPrice: json["PriceInfo"]["Price"]["PickupPrice"].toString() ?? "0",
        tablePrice: json["PriceInfo"]["Price"]["TablePrice"].toString() ?? "0",
        isVegetarian: json["DishInfo"]["Classifications"]["IsVegetarian"],
        isHalal: json["DishInfo"]["Classifications"]["IsHalal"],
        categoryIds: json["CategoryIDs"],
        productId: json["MetaData"]["ProductID"],
        productName: json["MetaData"]["ProductName"],
        unitChartId: json["MetaData"]["UnitChartID"],
        unitChartName: json["MetaData"]["UnitChartName"]);
  }
}
