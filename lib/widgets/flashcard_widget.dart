import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import '../models/flashcard.dart';

class FlashcardWidget extends StatelessWidget {
  final Flashcard flashcard;
  final FlipCardController controller;

  const FlashcardWidget({
    super.key,
    required this.flashcard,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      controller: controller,
      flipOnTouch: true,
      front: _buildCardSide(
        "Question",
        flashcard.question,
        Colors.blue.shade100,
      ),
      back: _buildCardSide("Answer", flashcard.answer, Colors.green.shade100),
    );
  }

  Widget _buildCardSide(String title, String content, Color color) {
    return Card(
      elevation: 4,
      color: color,
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
