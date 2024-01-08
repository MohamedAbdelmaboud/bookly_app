import 'package:bookly_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start, required this.ratingsCount,  this.averageRating,
  });
  final num ratingsCount;
  final num? averageRating;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 15,
        ),
        const SizedBox(
          width: 6.3,
        ),
        const Text(
          '4.2',
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          '($ratingsCount)',
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        )
      ],
    );
  }
}
