import 'package:course_ed_tech/domain/entities/QUESTION_ENTITY/question_entity.dart';
import 'package:course_ed_tech/presentation/screens/LESSONS/screens/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.questions});

  final List<Question> questions;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answered = false;
  int score = 0;

  void onAnswerTap(int index) {
    if (answered) return;

    setState(() {
      selectedAnswerIndex = index;
      answered = true;

      if (index == widget.questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        answered = false;
      });
    } else if (score == widget.questions.length) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => ResultScreen()),
      );
    } else {
      // Квиз завершён
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text("Тест завершён!"),
              content: Text(
                "Вы набрали $score из ${widget.questions.length} баллов.",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      currentQuestionIndex = 0;
                      selectedAnswerIndex = null;
                      answered = false;
                      score = 0;
                    });
                  },
                  child: const Text("Пройти снова"),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      body: Center(
        child: Column(
          children: [
            Text(
              'Вопрос ${currentQuestionIndex + 1}/${widget.questions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion.questionText,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ...List.generate(currentQuestion.answers.length, (index) {
              final answer = currentQuestion.answers[index];
              final isSelected = index == selectedAnswerIndex;
              final isCorrect = index == currentQuestion.correctAnswerIndex;

              Color? color;
              if (answered) {
                if (isSelected && isCorrect) {
                  color = Colors.green;
                } else if (isSelected && !isCorrect) {
                  color = Colors.red;
                } else if (!isSelected && isCorrect) {
                  color = Colors.green;
                } else {
                  color = Colors.grey[300];
                }
              } else {
                color = Colors.white10;
              }

              return GestureDetector(
                onTap: () => onAnswerTap(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 58,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(answer, style: const TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
              );
            }),
            if (answered)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: nextQuestion,
                  child: Text(
                    currentQuestionIndex == widget.questions.length - 1
                        ? 'Завершить'
                        : 'Следующий',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
