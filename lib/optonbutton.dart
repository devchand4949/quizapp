import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Optionbutton extends StatelessWidget {
  Optionbutton({super.key, required this.txt, required this.ontap});

  final String txt;
  final void Function() ontap;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: () {
          ontap();
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: Color.fromARGB(255, 33, 1, 95),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          txt,style: GoogleFonts.lato(),
        ));
  }
}
