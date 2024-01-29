import 'package:bookly_app/core/widgets/custom_spinkit.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
            itemCount: state.bookModels.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: NewestItem(
                  bookModel: state.bookModels[index],
                ),
              );
            },
          );
        } else if (state is NewsetBooksFailure) {
          return Column(
            children: [
              const Icon(Icons.error, size: 40),
              Text(state.errorMessage)
            ],
          );
        } else {
         return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: const Center(child: spinkit));
        }
      },
    );
  }
}
