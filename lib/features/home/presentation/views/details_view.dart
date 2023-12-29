import 'package:bookly_app/core/utlis/styles.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);
  static String id = '/DetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              const BookItem(),
              const SizedBox(
                height: 43,
              ),
              const Text(
                'The jungle Book',
                style: Styles.textStyle25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  'Rudyard kipling',
                  style: Styles.textStyle16.copyWith(
                      color: Colors.white.withOpacity(0.6),
                      fontStyle: FontStyle.italic),
                ),
              ),
              const RatingRow(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(
                height: 25,
              ),
              const BookAction(),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'You can also Like',
                style: Styles.textStyle16,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    required this.borderRadius,
  });
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
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
