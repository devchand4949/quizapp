import 'package:flutter/material.dart';
import 'package:quizeapp/data/question.dart';
import 'package:quizeapp/question_summary.dart';
import 'package:quizeapp/quition_screen.dart';
import 'quiz.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.choesenAnswer, required this.restartQuiz});

  final void Function() restartQuiz;

  final List<String> choesenAnswer;
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summery = [];
    for (var i = 0; i < choesenAnswer.length; i++) {
      summery.add({
        'question_index': i,
        'question': question[i].text,
        'correct_answer': question[i].ans[0],
        'user_answer': choesenAnswer[i]
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestion = question.length;

    final correctQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all((40)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Your answer $correctQuestion out of $totalQuestion question correctly',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFC5C2E7))),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton(
                onPressed: restartQuiz,
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    side: BorderSide(color: Colors.white)),
              )
            ],
          ),
        ));
  }
}
