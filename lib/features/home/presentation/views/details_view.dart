import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  static String id = '/DetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsViewBody(
        bookModel: bookModel,
      ),
    );
  }
}
