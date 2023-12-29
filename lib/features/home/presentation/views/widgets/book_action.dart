import 'package:bookly_app/features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomButton(
          text: r'19.99$',
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
        ),
        CustomButton(
            text: 'Free Preview',
            textColor: Colors.white,
            backgroundColor: Color(0xffEF8262),
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(10),
            )),
      ],
    );
  }
}
