class MenuEntity{
  final String id;
  final String type;

  MenuEntity({required this.id, required this.type});

  factory MenuEntity.fromJson(Map<String, dynamic> json) {
    return MenuEntity(
      id: json['ID'],
      type: json['Type'],
    );
  }
}