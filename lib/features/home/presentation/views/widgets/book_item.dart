import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red,
                image: const DecorationImage(
                  image: AssetImage('assets/images/test_image.png'),
                ))),
      ),
    );
  }
}
