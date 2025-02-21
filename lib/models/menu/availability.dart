class AvailabilityModel {
  final String startTime;
  final String endTime;

  AvailabilityModel({
    required this.startTime,
    required this.endTime,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(
      startTime: json['StartTime'],
      endTime: json['EndTime'],
    );
  }
}