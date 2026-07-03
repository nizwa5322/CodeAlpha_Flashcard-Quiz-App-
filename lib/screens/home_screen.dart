import 'package:flutter/material.dart';
import 'package:flip_card/flip_card_controller.dart';
import '../models/flashcard.dart';
import '../data/flashcard_data.dart';
import '../widgets/flashcard_widget.dart';
import '../widgets/add_edit_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Flashcard> _flashcards = List.from(initialFlashcards);
  int _currentIndex = 0;
  final FlipCardController _cardController = FlipCardController();

  void _nextCard() {
    if (_currentIndex < _flashcards.length - 1) {
      _resetFlip();
      setState(() => _currentIndex++);
    }
  }

  void _prevCard() {
    if (_currentIndex > 0) {
      _resetFlip();
      setState(() => _currentIndex--);
    }
  }

  void _resetFlip() {
    if (!_cardController.state!.isFront) {
      _cardController.toggleCard();
    }
  }

  void _addOrEditFlashcard({Flashcard? card}) {
    showDialog(
      context: context,
      builder: (_) => AddEditDialog(
        flashcard: card,
        onSave: (q, a) {
          setState(() {
            if (card == null) {
              _flashcards.add(Flashcard(question: q, answer: a));
            } else {
              card.question = q;
              card.answer = a;
            }
          });
        },
      ),
    );
  }

  void _deleteCard() {
    if (_flashcards.length > 0) {
      setState(() {
        _flashcards.removeAt(_currentIndex);
        if (_currentIndex >= _flashcards.length && _currentIndex > 0)
          _currentIndex--;
      });
      _resetFlip();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flashcard Quiz"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Card ${_currentIndex + 1} of ${_flashcards.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FlashcardWidget(
                flashcard: _flashcards[_currentIndex],
                controller: _cardController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () => _cardController.toggleCard(),
              icon: const Icon(Icons.remove_red_eye),
              label: const Text("Show Answer"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                onPressed: _prevCard,
                icon: const Icon(Icons.arrow_back),
                label: const Text("Previous"),
              ),
              OutlinedButton.icon(
                onPressed: _nextCard,
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Next"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () =>
                      _addOrEditFlashcard(card: _flashcards[_currentIndex]),
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _deleteCard,
                  icon: const Icon(Icons.delete),
                  label: const Text("Delete"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditFlashcard(),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
