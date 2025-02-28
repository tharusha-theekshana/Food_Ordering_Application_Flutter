import 'package:intl/intl.dart';

class Availability{
  final String startTime;
  final String endTime;

  Availability({
    required this.startTime,
    required this.endTime,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      startTime: _formatTime(json['StartTime']),
      endTime: _formatTime(json['EndTime']),
    );
  }

  static String _formatTime(String time) {
    try {
      DateTime parsedTime = DateFormat("HH:mm:ss").parse(time); // Parse the input string
      return DateFormat("HH:mm").format(parsedTime); // Format to HH:mm (without seconds)
    } catch (e) {
      return time; // Return original if parsing fails
    }
  }
}