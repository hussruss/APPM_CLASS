import 'dart:math';
import 'package:flutter/material.dart';
import 'package:m1_s4/models/questions.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;

  void checkAnswer(bool value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado'),
          content: Text(
            questions[questionIndex].isCorrect(value)
                ? '¡Correcto!'
                : '¡Incorrecto!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (questionIndex < questions.length - 1) {
                  setState(() {
                    questionIndex++;
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Fin del Cuestionario'),
                        content: Text('Has completado todas las preguntas.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                questionIndex = 0;
                              });
                            },
                            child: Text('Reiniciar Cuestionario'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuestionario de Verdadero o Falso'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[questionIndex].text,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => checkAnswer(true),
                  child: Text('Verdadero'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => checkAnswer(false),
                  child: Text('Falso'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RandomQuizPage extends StatefulWidget {
  @override
  _RandomQuizPageState createState() => _RandomQuizPageState();
}

class _RandomQuizPageState extends State<RandomQuizPage> {
  List<String> _questionsList = [
    'Cuál es tu animal favorito?',
    'Cuál es tu comida favorita?',
    'Cuál es tu temporada favorita'
  ];

  List<String> _questionsImagesList = [
    'https://www.worldanimalprotection.us/sites/default/files/styles/600x400/public/media/header_updated_0.png?h=55cb88a5&itok=hcHgpiWr',
    'https://m.media-amazon.com/images/I/61-wbSj6AWL.jpg',
    'https://i.pinimg.com/1200x/ac/0b/29/ac0b294e3faacc4439002ae3146f9ceb.jpg'
  ];

  String randomQuestion = '';
  String randomImageQuestion =
      'https://www.worldanimalprotection.us/sites/default/files/styles/600x400/public/media/header_updated_0.png?h=55cb88a5&itok=hcHgpiWr';

  void generateRandomQuestion() {
    Random random = Random();
    int randomIndex = random.nextInt(_questionsList
        .length); // Genera un índice aleatorio basado en la longitud de la lista de preguntas
    setState(() {
      randomQuestion = _questionsList[
          randomIndex]; // Asigna una pregunta aleatoria a la variable randomQuestion
      randomImageQuestion = _questionsImagesList[
          randomIndex]; // Asigna una imagen aleatoria a la variable randomQuestion
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas Aleatorias'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              randomQuestion,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  generateRandomQuestion, // Llama a la función generateRandomQuestion al presionar el botón
              child: Text('Generar Pregunta Aleatoria'),
            ),
            Image.network(randomImageQuestion)
          ],
        ),
      ),
    );
  }
}
