import 'package:uuid/uuid.dart';

class Flashcard {
  final String id;
  String question;
  String answer;

  Flashcard({String? id, required this.question, required this.answer})
    : id = id ?? const Uuid().v4();

  // Helper method to create a copy of the flashcard with updated values
  Flashcard copyWith({String? question, String? answer}) {
    return Flashcard(
      id: id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }
}
