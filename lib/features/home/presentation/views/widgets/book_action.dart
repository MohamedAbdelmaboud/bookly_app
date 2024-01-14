import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/web_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookAction extends StatelessWidget {
  const BookAction({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onPressed: () {},
          text: r'Free',
          borderRadius:
              const BorderRadius.horizontal(left: Radius.circular(10)),
        ),
        CustomButton(
            onPressed: () {
              GoRouter.of(context).push(WebView.id, extra: bookModel);
            },
            text: 'Preview',
            textColor: Colors.white,
            backgroundColor: const Color(0xffEF8262),
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(10),
            )),
      ],
    );
  }
}
