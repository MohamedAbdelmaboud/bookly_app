import 'package:bookly_app/core/utlis/styles.dart';
import 'package:bookly_app/features/home/presentation/views/details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = '/HomeView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24),
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomAppBar(),
              BooksListView(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Best saller',
                  style: Styles.textStyle18,
                ),
              ),
              BestSellerListView(),
            ]),
          ),
        ),
      ),
    );
  }
}

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: BestSellerItem(),
        );
      },
    );
  }
}

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(DetailsView.id);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 125,
            child: CustomImage(),
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
                    'Harry poter and the Goblet of Fire',
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
                  'J.K. Rowling',
                  style: Styles.textStyle16
                      .copyWith(color: Colors.white.withOpacity(0.6)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'19.99 $',
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const RatingRow()
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

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
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
          '4.8',
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          '(125)',
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        )
      ],
    );
  }
}
