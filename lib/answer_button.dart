import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatelessWidget {
  const Answer({required this.answers, required this.onTap, super.key});
  final String answers;
  final void Function() onTap;

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 40,
              ),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 33, 1, 95),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
          child: Text(
            answers,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(),
          ),
        ),
        const SizedBox(
          height: 9,
        )
      ],
    );
  }
}
