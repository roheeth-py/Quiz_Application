import 'package:flutter/material.dart';
import 'package:quiz_app/data/qa.dart';
import 'package:quiz_app/question_summary.dart';

class Result extends StatelessWidget {
  const Result(this.restartQuiz, this.answers, {super.key});
  final List<String> answers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answers.length; i++) {
      summary.add(
        {
          "q_index": i + 1,
          "question": quizQuestions[i].questions,
          "crt_ans": quizQuestions[i].answers[0],
          "user_ans": answers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final totalquestions = quizQuestions.length;
    final crtanswers = summaryData.where(
      (data) {
        return (data["crt_ans"] == data["user_ans"]);
      },
    ).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
            "You have answers $crtanswers out of $totalquestions questions \n correctly!",
            textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
        const SizedBox(
          height: 25,
        ),
        QuestionSummary(summaryData),
        const SizedBox(height: 15,),
        TextButton(
          onPressed: restartQuiz,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.restore),
              Text(
                "Restart Quiz",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],
    );
  }
}
