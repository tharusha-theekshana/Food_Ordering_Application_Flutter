class ModifierOptions {
  final String optionId;
  final String type;

  ModifierOptions({required this.optionId, required this.type});

  factory ModifierOptions.fromJson(Map<String, dynamic> json) {
    return ModifierOptions(optionId: json["Id"], type: json["Type"]);
  }
}
