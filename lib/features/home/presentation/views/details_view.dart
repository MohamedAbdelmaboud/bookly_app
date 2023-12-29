import 'package:bookly_app/core/utlis/styles.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/like_list_view.dart';
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
              SizedBox(
                  height: MediaQuery.of(context).size.height * .30,
                  child: const CustomImage()),
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
               Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also Like ♥',
                  style: Styles.textStyle16.copyWith(fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const LikeListView(),
            ],
          ),
        ),
      ),
    );
  }
}
