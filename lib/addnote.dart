import 'package:flutter/material.dart';
import 'model/note.dart';
import 'controller/note_service.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String title = "";
  String description = "";
  final NoteService _noteService = NoteService();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: TextButton(
          child: Text('confirm'),
          onPressed: () {

            Navigator.pop(
              context,
              Note(
                title: title,
                description: description,
                dateTime: DateTime.now(),
              ),
            );
          },
        ),
      ),
    );
  }
}
