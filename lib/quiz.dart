import 'package:flutter/material.dart';
import 'package:quiz_app/model/dummy_questions.dart';
import 'package:quiz_app/quiz_question.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  Widget? currentScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    currentScreen = StartScreen(switchScreen);
    super.initState();
  }
  

  void switchScreen(){
    setState(() {
      currentScreen = QuizQuestion(onAnswerSelect: addSelectedAnswers,);
    });
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      currentScreen = QuizQuestion(onAnswerSelect: addSelectedAnswers);
    });
  }

  void addSelectedAnswers(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState( () {
        currentScreen = ResultScreen(selectedAnswers, restartQuiz);
      });
    }
  }

  @override
  Widget build(context){
    return MaterialApp(
    home:  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepOrange,
              Colors.orange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
        ),
        child: Center(
          child:  currentScreen,
          ),
        ) 
      ) 
  );
  }
}