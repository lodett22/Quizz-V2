import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto04teo/componentes/boton.dart';
import 'package:proyecto04teo/data/questions.dart';


class PantallaRespuesta extends StatefulWidget {
  const PantallaRespuesta({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<PantallaRespuesta> createState() => _PantallaRespuestaState();
}

class _PantallaRespuestaState extends State<PantallaRespuesta> {
  var currentQuestionIndex = 0;

  void respuestaPregunta(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.barajarRespuestas().map((answer) {
              return BotonRespuesta(
                text: answer,
                onTap: () {
                  respuestaPregunta(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}