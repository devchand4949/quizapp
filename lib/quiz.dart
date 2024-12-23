import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'package:quizeapp/data/question.dart';
import 'quition_screen.dart';
import 'result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});


  @override
  State<Quiz> createState() {
    return _QuizeState();
  }
}

class _QuizeState extends State<Quiz> {
   List<String> _selecteAnswer = []; // store the selected ans

  Widget? activeScreen; // ? means not a null

  @override
  void initState() {
    activeScreen =
        StartScreen(switchScreen); //switchScreen is perameter type value
    // first run initstate method after call the setstate method.
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuitionScreen(
        onSelecAnswer: chooesAnswer,
      );
    });
  }
   void restartQuiz(){
        setState(() {
          _selecteAnswer = [];
          activeScreen = QuitionScreen(onSelecAnswer: chooesAnswer);
        });
   }

  void chooesAnswer(String answer) {
     _selecteAnswer.add(answer);

    if (_selecteAnswer.length == question.length) {
      setState(() {
        activeScreen = ResultScreen(choesenAnswer: _selecteAnswer,restartQuiz: restartQuiz,);
      });
    }

  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF3378FF),
          // gradient: LinearGradient(colors: [
          //   Color.fromARGB(244, 27, 81, 220),
          //   Color.fromARGB(228, 27, 81, 220),
          // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: activeScreen, //this is a variable type widget
      ),
    ));
  }
}
