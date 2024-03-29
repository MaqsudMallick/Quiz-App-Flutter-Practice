import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_question.dart';
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

  @override
  void initState() {
    currentScreen = StartScreen(switchScreen);
    super.initState();
  }
  

  void switchScreen(){
    setState(() {
      currentScreen = const QuizQuestion();
    });
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
              Color.fromARGB(255, 247, 174, 17)
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