import 'package:flutter/material.dart';

class TagTextWidget extends StatelessWidget {
  final String tagText;
  final Color textColor;
  final Color backgroundColor;
  final double deviceHeight;
  final double deviceWidth;

  TagTextWidget(
      {required this.tagText,
      required this.backgroundColor,
      required this.textColor,
      required this.deviceHeight,
      required this.deviceWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth * 0.13,
      padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.005),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        tagText,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: textColor, fontSize: 8.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
