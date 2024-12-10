import 'package:flutter/material.dart';
import 'package:proyecto04teo/data/questions.dart';
import 'package:proyecto04teo/screens/pantalla_respuestas.dart';
import 'package:proyecto04teo/screens/inicio.dart';
import 'package:proyecto04teo/screens/pantalla_resultados.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void cambiarPantalla() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void elegirRespuesta(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void reiniciarQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Inicio(cambiarPantalla);

    if (activeScreen == 'questions-screen') {
      screenWidget = PantallaRespuesta(onSelectAnswer: elegirRespuesta);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = PantallaPreguntas(
        chosenAnswers: selectedAnswers,
        onRestart: reiniciarQuiz,
      );
    }

    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 17, 100, 187),
                Color.fromARGB(255, 19, 17, 187),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}