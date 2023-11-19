import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: const Color.fromARGB(155, 255, 255, 255),
          ),
          const SizedBox(height: 25),
          Text("Learn flutter the fun way!",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(color: Colors.white,fontSize: 24),),
          const SizedBox(height: 20 ),
          OutlinedButton(
            onPressed: switchScreen,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Start Quiz"),
                Icon(Icons.arrow_right_alt),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
