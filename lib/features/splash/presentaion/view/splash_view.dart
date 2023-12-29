import 'dart:async';

import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentaion/view/widgets/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  static String id = 'SplashView';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    //navigation get
    naviagteToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }

  void naviagteToHome() {
    Timer(const Duration(seconds: 4), () {
      GoRouter.of(context).pushReplacement(HomeView.id);
    });
  }
}
