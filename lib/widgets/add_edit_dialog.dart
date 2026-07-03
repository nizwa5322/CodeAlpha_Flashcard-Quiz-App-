import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class AddEditDialog extends StatefulWidget {
  final Flashcard? flashcard;
  final Function(String, String) onSave;

  const AddEditDialog({super.key, this.flashcard, required this.onSave});

  @override
  State<AddEditDialog> createState() => _AddEditDialogState();
}

class _AddEditDialogState extends State<AddEditDialog> {
  late TextEditingController _questionController;
  late TextEditingController _answerController;

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController(
      text: widget.flashcard?.question ?? '',
    );
    _answerController = TextEditingController(
      text: widget.flashcard?.answer ?? '',
    );
  }

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.flashcard == null ? "Add Flashcard" : "Edit Flashcard",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _questionController,
            decoration: const InputDecoration(labelText: "Question"),
          ),
          TextField(
            controller: _answerController,
            decoration: const InputDecoration(labelText: "Answer"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_questionController.text.isNotEmpty &&
                _answerController.text.isNotEmpty) {
              widget.onSave(_questionController.text, _answerController.text);
              Navigator.pop(context);
            }
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
