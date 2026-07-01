import 'package:flutter/material.dart';

void main() {
  runApp(const FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlashcardScreen(),
    );
  }
}

// 1. Define the Flashcard Data Structure
class Flashcard {
  final String question;
  final String answer;

  const Flashcard({required this.question, required this.answer});
}

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  // 2. Sample Flashcard List
  final List<Flashcard> _flashcards = [
    const Flashcard(
      question: "What is the capital of France?",
      answer: "Paris",
    ),
    const Flashcard(question: "What is 5 + 7?", answer: "12"),
    const Flashcard(
      question: "Who wrote 'Romeo and Juliet'?",
      answer: "William Shakespeare",
    ),
    const Flashcard(
      question: "What is the powerhouse of the cell?",
      answer: "Mitochondria",
    ),
  ];

  int _currentIndex = 0;
  bool _showAnswer = false;

  void _nextCard() {
    setState(() {
      // Loop back to the first card if we reach the end
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
      _showAnswer = false; // Reset to show the question for the next card
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentCard = _flashcards[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard Quiz'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Card Progress Indicator
              Text(
                "Card ${_currentIndex + 1} of ${_flashcards.length}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // 3. The Interactive Flashcard UI
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showAnswer = !_showAnswer;
                  });
                },
                child: Card(
                  elevation: 6,
                  color: _showAnswer
                      ? Colors.green.shade100
                      : Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _showAnswer ? "ANSWER" : "QUESTION",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _showAnswer
                                ? Colors.green.shade700
                                : Colors.blue.shade700,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _showAnswer
                              ? currentCard.answer
                              : currentCard.question,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Tap to flip",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // 4. Next Button
              ElevatedButton.icon(
                onPressed: _nextCard,
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Next Card"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
