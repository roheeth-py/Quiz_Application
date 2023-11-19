import 'package:flutter/material.dart';
import 'package:quiz_app/data/qa.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectEvent});

  final void Function(String answers) onSelectEvent;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int index = 0;

  void indexChange(String answers) {
    widget.onSelectEvent(answers);
    setState(
      () {
        index++;
      },
    );
  }

  @override
  Widget build(context) {
    final currentQuestion = quizQuestions[index];
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.questions,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            ...currentQuestion.shuffledList().map((answer) {
              return Answer(
                answers: answer,
                onTap: () {
                  indexChange(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
