import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png', 
          height: 300,
          color: const Color.fromARGB(179, 255, 255, 255),
          ),
        const  SizedBox(height: 90,),
        Text('Learn flutter the fun way!',
          textAlign: TextAlign.center, 
          style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
        ),
        const  SizedBox(height: 30,),
        TextButton.icon(
          onPressed: startQuiz,
          style: TextButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_forward), 
          label: const Text(
            'Start Quiz',
            )
          )
      ],
    );
  }
}