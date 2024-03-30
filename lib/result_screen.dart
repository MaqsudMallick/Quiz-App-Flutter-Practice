import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/model/dummy_questions.dart';
class ResultScreen extends StatelessWidget{
  const ResultScreen(this.userResponse, this.onRestart, {super.key});
  final List<String> userResponse;
  final void Function() onRestart;
  @override
  Widget build(BuildContext context) {
    int noCorrectAnswers = 0;
    List<Map<String, Object>> ref = [];
    for(int i=0; i<userResponse.length; i++){
      if(userResponse[i]==questions[i].answers[0]){
        noCorrectAnswers++;
      }
      ref.add({
        'index': i,
        'question': questions[i].questionText,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': userResponse[i]
      });
    }
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'You answered $noCorrectAnswers out of ${questions.length} questions correctly!',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30,),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: ref.map((e) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: (e['correctAnswer']==e['userAnswer'])?Colors.green:Colors.pink,
                          shape: BoxShape.circle,
                        ),
                        child:  Text(
                          ((e['index'] as int) +1).toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                            
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['question'] as String,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              e['correctAnswer'] as String,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 81, 0, 211),
                              ),
                            ),
                            Text(e['userAnswer'] as String,
                              textAlign: TextAlign.left,
                              style:  const TextStyle(
                                color: Color.fromARGB(255, 59, 15, 66),
                              ),
                            ),
                            const SizedBox(height: 10)
                          ],
                        )
                      )
                    ]
                  );
                }).toList(),
              ),
              ),
          ),
          const SizedBox(height: 30,),
          TextButton.icon(
            onPressed: onRestart,
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
            ), 
            label: Text(
              'Restart Now!',
              style: GoogleFonts.lato(
                color: Colors.white,
              )
            ),
            icon: const Icon(Icons.refresh), 
          )
        ],
        ),
    );
    
  }
}