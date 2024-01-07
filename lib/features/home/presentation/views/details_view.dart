import 'package:bookly_app/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);
  static String id = '/DetailsView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailsViewBody(),
    );
  }
}
