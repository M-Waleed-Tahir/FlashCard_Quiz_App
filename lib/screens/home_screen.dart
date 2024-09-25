import 'package:flutter/material.dart';
import 'add_flashcard_screen.dart';
import 'quiz_screen.dart';
import '../models/flashcard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Flashcard> _flashcards = [];

  void _addFlashcard(Flashcard flashcard) {
    setState(() {
      _flashcards.add(flashcard);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'FlashCard Quiz App',
                style: TextStyle(
                    color: const Color.fromARGB(255, 190, 210, 171),
                    fontSize: 30,
                    fontFamily: 'Montserrat'),
              ),
              SizedBox(height: 490),
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% of screen width
                height: 60, // Height for the button
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(
                        255, 190, 210, 171), // Button text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'Add Flashcard',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat' // Font size of the button text
                        ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddFlashcardScreen(_addFlashcard),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20), // Space between buttons
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.7, // Slightly smaller width than Add Flashcard
                height: 55, // Slightly smaller height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(
                        255, 190, 210, 171), // Button text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'Start Quiz',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat' // Slightly smaller font size
                        ),
                  ),
                  onPressed: () {
                    if (_flashcards.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(_flashcards),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
