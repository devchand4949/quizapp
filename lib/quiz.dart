import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'quition_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizeState();
  }
}

class _QuizeState extends State<Quiz> {
  Widget? activeScreen; // ? means not a null

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen); //switchScreen is perameter type value
    // first run initstate method after call the setstate method.
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuitionScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(244, 27, 81, 220),
            Color.fromARGB(228, 27, 81, 220),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: activeScreen, //this is a variable type widget
      ),
    ));
  }
}
