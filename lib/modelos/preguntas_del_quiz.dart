class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> barajarRespuestas() {
    final respuestasbarajadas = List.of(answers);
    respuestasbarajadas.shuffle();
    return respuestasbarajadas;
  }
}