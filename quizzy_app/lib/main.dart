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
    Question('Is this question true?', true),
    Question('Is 2 + 2 == 4?', true),
    Question('Android isn\'t a Linux machine', false),
  ];

  int questionNumber = 0;

  void showQuizCompleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete'),
        content: const Text('You have reached the end of the quiz.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void nextQuestion() {
    setState(() {
      if (questionBank.length - 1 > questionNumber) {
        questionNumber++;
      } else {
        showQuizCompleteDialog();
        restartGame();
      }
    });
  }

  void restartGame() {
    setState(() {
      questionNumber = 0;
      scoreKeeper = [];
    });
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questionBank[questionNumber].questionAnswer;

    setState(() {
      if (correctAnswer == userAnswer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questionBank[questionNumber];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Text(
                  currentQuestion.questionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
                        checkAnswer(true);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.green,
                        ),
                        height: 80,
                        child: const Center(
                          child: Text(
                            'TRUE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'San Francisco',
                                fontSize: 30,
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
                        checkAnswer(false);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        height: 80,
                        child: const Center(
                          child: Text(
                            'FALSE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'San Francisco',
                                fontSize: 30,
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
