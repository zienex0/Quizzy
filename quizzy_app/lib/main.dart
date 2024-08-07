import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(Quizzy());
}

class Quizzy extends StatelessWidget {
  const Quizzy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: const Text(
            'Quizzy',
            style: TextStyle(
                color: Colors.white, fontFamily: 'San Francisco', fontSize: 30),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<Question> questionBank = [
    Question(questionText: 'Is this question true?', questionAnswer: true),
    Question(questionText: 'Is 2 + 2 == 4?', questionAnswer: true),
    Question(
        questionText: 'Android isn\'t a Linux machine', questionAnswer: false),
  ];

  int questionNumber = 0;

  void correctAnswer() {
    setState(() {
      scoreKeeper.add(
        const Icon(Icons.check, color: Colors.green),
      );
      questionNumber++;
    });
  }

  void wrongAnswer() {
    setState(() {
      scoreKeeper.add(
        const Icon(Icons.close, color: Colors.red),
      );
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 6,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Text(
                  'Here goes the quiz question and answer it',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'San Francisco',
                      fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        // users taps on true button
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.green,
                        ),
                        height: 80, // Increase the height here
                        child: const Center(
                          child: Text(
                            'TRUE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'San Francisco',
                                fontSize: 30, // Increase the font size here
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () {
                        // user taps on false button
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        height: 80, // Increase the height here
                        child: const Center(
                          child: Text(
                            'FALSE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'San Francisco',
                                fontSize: 30, // Increase the font size here
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ],
      ),
    );
  }
}
