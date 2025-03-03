import 'package:flutter/material.dart';
import 'package:food_order_app/models/menu/availability.dart';
import 'package:food_order_app/utils/app_colors.dart';
import 'package:intl/intl.dart';

class AvailabilityDaysTagsWidget extends StatelessWidget {
  final Map<String, Availability> menuAvailability;
  late double _deviceHeight, _deviceWidth;

  AvailabilityDaysTagsWidget({required this.menuAvailability});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    String today = DateFormat('EEEE').format(DateTime.now());

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 10, horizontal: _deviceWidth * 0.02),
      height: _deviceHeight * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Text(
            "Availability : ",
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: _deviceHeight * 0.018,color: AppColors.secondGrayColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: menuAvailability.entries.map((entry) {
                String day = entry.key;
                Availability availability = entry.value;

                bool isToday = day.toLowerCase() == today.toLowerCase();

                return Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 2, horizontal: _deviceWidth * 0.08),
                    width: _deviceWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Text("$day : ",style: TextStyle(
                          color: isToday ? AppColors.greenColor : AppColors.secondGrayColor,
                          fontWeight: isToday ? FontWeight.bold : FontWeight.w500
                        ),)),
                        Expanded(
                            flex: 1,
                            child: Text("${availability.startTime} A.M - ",style: TextStyle(
                                color: isToday ? AppColors.greenColor : AppColors.secondGrayColor,
                                fontWeight: isToday ? FontWeight.bold : FontWeight.w500
                            ))),
                        Expanded(
                            flex: 1, child: Text("${availability.endTime} P.M",style: TextStyle(
                            color: isToday ? AppColors.greenColor : AppColors.secondGrayColor,
                            fontWeight: isToday ? FontWeight.bold : FontWeight.w500
                        )))
                      ],
                    ));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
