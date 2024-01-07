import 'package:bookly_app/features/home/presentation/views/details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentaion/views/splash_view.dart';
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
      path: DetailsView.id,
      builder: (context, state) => const DetailsView(),
    )
  ]);
}
