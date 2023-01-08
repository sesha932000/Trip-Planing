import 'package:flutter/material.dart';
import 'package:project/widgets/app_text.dart';
import 'package:project/widgets/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color bacgroundcolor;
  double size;
  final Color bordercolor;
  bool? isIcon;

  AppButtons(
      {Key? key,
      this.icon,
      this.isIcon = false,
      this.text = "hi",
      required this.size,
      required this.color,
      required this.bacgroundcolor,
      required this.bordercolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: bordercolor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: bacgroundcolor),
      child: isIcon == false
          ? Center(child: AppText(text: text!, color: color))
          : Center(child: Icon(icon, color: color)),
    );
  }
}
