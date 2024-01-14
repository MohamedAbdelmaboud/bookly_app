import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/presentation/views/web_view.dart';
import 'package:bookly_app/features/splash/presentaion/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class Routes {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: HomeView.id,
      builder: (context, state) => const HomeView(),
    ),
     GoRoute(
      path: WebView.id,
      builder: (context, state) =>  WebView(bookModel: state.extra as BookModel),
    ),
    GoRoute(
      path: DetailsView.id,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(HomeRepoImpl()),
        child:  DetailsView(bookModel: state.extra as BookModel,),
      ),
    )
  ]);
}
