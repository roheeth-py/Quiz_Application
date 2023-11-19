import 'package:flutter/material.dart';
import 'package:quiz_app/data/qa.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchState() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answers) {
    selectedAnswers.add(answers);

    if(selectedAnswers.length == quizQuestions.length) {
      setState(
        () {
          activeScreen = 'result-screen';
        },
      );
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchState);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(onSelectEvent: chooseAnswer);
    } else if (activeScreen == "result-screen") {
      screenWidget = Result(restartQuiz, selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
