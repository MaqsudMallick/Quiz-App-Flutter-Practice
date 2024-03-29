import 'package:flutter/material.dart';
import 'package:quiz_app/model/dummy_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestion extends StatefulWidget{
  const QuizQuestion({super.key});
  @override
  State<QuizQuestion> createState() {
    return _QuizQuestionState();
  }
}


class _QuizQuestionState extends State<QuizQuestion>{
  int questionIndex = 0;

  void nextQeuestion(){
    setState(() {
      if(questions.length!=(questionIndex+1)){
        questionIndex++;
      }
    });
  }

  @override 
  Widget build(context){
    final currentQuestion =  questions[questionIndex];
    return  Container( 
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.questionText,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 255, 248, 182),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60,),
          ...currentQuestion.shuffleAnswers().map((e) => AnswerButton(e, nextQeuestion)) 
        ],
      )
    );
  }
}


class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onClick, {super.key});
  final String answerText;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 22, 196, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ), 
        child: Text(answerText, textAlign: TextAlign.center,)
        )
      );
    
  }
}