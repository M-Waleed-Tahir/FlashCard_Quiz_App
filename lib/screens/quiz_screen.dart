import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class QuizScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  QuizScreen(this.flashcards);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  bool _showAnswer = false;

  void _nextCard(bool correct) {
    if (correct) {
      _score++;
    }

    setState(() {
      _currentIndex++;
      _showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex >= widget.flashcards.length) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 0, 0, 0),
                const Color.fromARGB(255, 51, 4, 4),
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Your Score: $_score/${widget.flashcards.length}',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      );
    }

    final currentCard = widget.flashcards[_currentIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 0, 0, 0),
              const Color.fromARGB(255, 51, 4, 4),
            ],
          ),
        ),
        child: SizedBox.expand(
          // Ensures the gradient fills the entire screen
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Question: ${currentCard.question}',
                      style: TextStyle(
                          fontSize: 24,
                          color: const Color.fromARGB(255, 190, 210, 171)),
                      textAlign:
                          TextAlign.center, // Centers the text for consistency
                    ),
                    SizedBox(height: 20),
                    if (_showAnswer)
                      Text(
                        'Answer: ${currentCard.answer}',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(
                        255, 190, 210, 171), // Button text color (white)
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), // Padding for the button
                  ),
                  child: Text(
                    _showAnswer ? 'Next' : 'Show Answer',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      _showAnswer = true;
                    });
                  },
                ),
              ),
              if (_showAnswer)
                Positioned(
                  bottom: 90,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: Text('Correct', style: TextStyle(fontSize: 16)),
                        onPressed: () => _nextCard(true),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child:
                            Text('Incorrect', style: TextStyle(fontSize: 16)),
                        onPressed: () => _nextCard(false),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
