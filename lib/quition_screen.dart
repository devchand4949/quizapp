import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizeapp/optonbutton.dart';
import 'package:quizeapp/data/question.dart';
import 'package:quizeapp/models/quiz_question.dart';

class QuitionScreen extends StatefulWidget {
  const QuitionScreen({super.key,required this.onSelecAnswer});

  final void Function(String answer) onSelecAnswer;

  @override
  State<QuitionScreen> createState() {
    return _QuitionScreenState();
  }
}

class _QuitionScreenState extends State<QuitionScreen> {
  var currentQuestionIndex = 0;

  void optionQuestion(String selectedAnswer) {
    widget.onSelecAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1 ;
      print('hellow');// increment the value by 1 (for question)
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = question[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all((40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // using map key:value dynmically
            ...currentQuestion.getShuffledAns().map((ans) {
              return Optionbutton(txt: ans, ontap: (){optionQuestion(ans);  },);
            })
            // and second method we can useable
            // Optionbutton(txt: currentQuestion.ans[0], ontap: () {}),
            // Optionbutton(txt: currentQuestion.ans[1], ontap: () {}),
            // Optionbutton(txt: currentQuestion.ans[2], ontap: () {}),
            // Optionbutton(txt: currentQuestion.ans[3], ontap: () {}),
          ],
        ),
      ),
    );
  }
}
