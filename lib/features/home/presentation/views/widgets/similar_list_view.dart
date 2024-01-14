import 'package:bookly_app/core/widgets/custom_spinkit.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimailarListView extends StatefulWidget {
  const SimailarListView({
    super.key,
  });

  @override
  State<SimailarListView> createState() => _SimailarListViewState();
}

class _SimailarListViewState extends State<SimailarListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.bookModels.length,
              itemBuilder: (BuildContext context, int index) {
                return  CustomImage(
                  imageUrl:
                      state.bookModels[index].volumeInfo.imageLinks!.thumbnail,
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Column(
            children: [
              const Icon(Icons.error, size: 40),
              Text(state.errorMessage)
            ],
          );
        } else {
          return const Center(child: spinkit2);
        }
      },
    );
  }
}
