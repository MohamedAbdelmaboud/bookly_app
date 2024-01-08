import 'package:bookly_app/core/utlis/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(DetailsView.id);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: CustomImage(
              imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    bookModel.volumeInfo.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20
                        .copyWith(fontFamily: 'GTSectraFineRegular'),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  bookModel.volumeInfo.authors![0],
                  style: Styles.textStyle16
                      .copyWith(color: Colors.white.withOpacity(0.6)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Free',
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const RatingRow(ratingsCount: 155,)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
