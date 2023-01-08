import 'package:flutter/material.dart';
import 'package:project/widgets/app_text.dart';
import 'package:project/widgets/colors.dart';

class responsiveButton extends StatelessWidget {
  bool? isresponsive;
  double? width;

  responsiveButton({
    Key? key,
    this.isresponsive = false,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isresponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: isresponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isresponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(
                      text: "Book Trip Now",
                      color: Colors.white,
                    ),
                  )
                : Container(),
            Image.asset(
              "images/arrow123.png",
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
