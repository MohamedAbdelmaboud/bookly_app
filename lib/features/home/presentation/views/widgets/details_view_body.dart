import 'package:bookly_app/core/utlis/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating_row.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key, required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 35,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      color: Colors.white,
                      FontAwesomeIcons.cartShopping,
                    )),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * .25,
                child:  CustomImage(
                  imageUrl:
                      bookModel.volumeInfo.imageLinks!.thumbnail,
                )),
            const SizedBox(
              height: 10,
            ),
             Text(
               bookModel.volumeInfo.title!,
               textAlign: TextAlign.center,
               maxLines: 2,
               overflow: TextOverflow.ellipsis,
              style: Styles.textStyle25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                bookModel.volumeInfo.authors![0],
                style: Styles.textStyle12.copyWith(
                    color: Colors.white.withOpacity(0.6),
                    fontStyle: FontStyle.italic),
              ),
            ),
             RatingRow(
              mainAxisAlignment: MainAxisAlignment.center,
              ratingsCount: bookModel.volumeInfo.pageCount!,
            ),
            const SizedBox(
              height: 25,
            ),
             BookAction(bookModel: bookModel,),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also Like ♥',
                style: Styles.textStyle14.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SimailarListView(),
          ],
        ),
      ),
    );
  }
}
