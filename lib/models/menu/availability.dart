class Availability{
  final String startTime;
  final String endTime;

  Availability({
    required this.startTime,
    required this.endTime,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      startTime: json['StartTime'],
      endTime: json['EndTime'],
    );
  }
}