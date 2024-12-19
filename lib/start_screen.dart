import 'package:flutter/material.dart';
import 'quiz.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz ,{super.key});

  final void Function()  startQuiz;// intialize a function and pass parameter uper

  static Color whitecol = Colors.white;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: whitecol,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Learn flutter the fun way!",
            style: TextStyle(
                fontSize: 25, color: whitecol, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed:(){
              startQuiz();// calling the function startQuize()
            } ,
            icon: Icon(
              Icons.arrow_right_alt,
              size: 30,
              color: whitecol,
            ),
            label: Text(
              'Start quize',
              style: TextStyle(
                fontSize: 20,
                color: whitecol,
              ),
            ),
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              side: BorderSide(color: whitecol)
            ),
          ),
        ],
      ),
    );
  }
}
