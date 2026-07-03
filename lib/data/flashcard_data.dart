import '../models/flashcard.dart';

List<Flashcard> initialFlashcards = [
  Flashcard(
    question: "What is Flutter?",
    answer: "An open-source UI software development kit created by Google.",
  ),
  Flashcard(question: "What language is used for Flutter?", answer: "Dart."),
  Flashcard(
    question: "What is a Widget?",
    answer: "The basic building block of a Flutter app's user interface.",
  ),
  Flashcard(
    question: "What is 'setState'?",
    answer:
        "A method used to notify the framework that the internal state of an object has changed.",
  ),
  Flashcard(
    question: "What is the root of the widget tree?",
    answer: "The 'runApp' function takes the root widget.",
  ),
  Flashcard(
    question: "What is a 'StatelessWidget'?",
    answer: "A widget that does not require mutable state.",
  ),
  Flashcard(
    question: "What is a 'StatefulWidget'?",
    answer: "A widget that has mutable state that can change over time.",
  ),
  Flashcard(
    question: "What is Hot Reload?",
    answer:
        "A feature that allows you to quickly experiment, build UIs, and add features without restarting the app.",
  ),
  Flashcard(
    question: "What is a 'Scaffold'?",
    answer:
        "A widget that implements the basic visual layout structure of Material Design.",
  ),
  Flashcard(
    question: "What is a 'Container'?",
    answer:
        "A convenience widget that combines common painting, positioning, and sizing widgets.",
  ),
];
