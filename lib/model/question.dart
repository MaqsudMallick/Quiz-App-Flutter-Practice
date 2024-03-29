class Question{
  const Question(this.questionText, this.answers);
  final String questionText;
  final List<String> answers;
  List<String> shuffleAnswers(){
    var copy = List.of(answers);
    copy.shuffle();
    return copy;
  }
}

