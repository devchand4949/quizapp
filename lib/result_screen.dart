import 'package:flutter/material.dart';
import 'package:quizeapp/data/question.dart';
import 'package:quizeapp/question_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.choesenAnswer});

  final List<String> choesenAnswer;
  List<Map<String, Object>> getSummeryData() {
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

    final summaryData = getSummeryData();
    final totalQuestion = question.length;

    final correctQuestion = summaryData.where((data){
      return data[['user_answer']]==data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all((40)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your answer $totalQuestion out of $totalQuestion question correctly'),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData),
              const Text("List of answer and question"),
              const SizedBox(
                height: 30,
              ),
              TextButton(onPressed: () {}, child: Text('Restart Quiz'))
            ],
          ),
        ));
  }
}
