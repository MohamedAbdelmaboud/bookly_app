import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/Logo.png'),
        const SizedBox(
          height: 20,
        ),
        Align(
          child: DefaultTextStyle(
            style: GoogleFonts.pacifico(color: Colors.white, fontSize: 25),
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                WavyAnimatedText('Read books for free',
                    speed: const Duration(milliseconds: 150)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
