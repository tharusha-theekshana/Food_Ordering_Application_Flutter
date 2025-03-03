class ModifierOption {
  final String optionId;
  final String type;

  ModifierOption({required this.optionId, required this.type});

  factory ModifierOption.fromJson(Map<String, dynamic> json) {
    return ModifierOption(optionId: json["Id"], type: json["Type"]);
  }
}
