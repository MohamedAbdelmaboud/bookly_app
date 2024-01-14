import 'package:bookly_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    required this.borderRadius,
  });
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPressed;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed:onPressed,
          style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              )),
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
