import 'constants.dart';
import 'package:flutter/material.dart';
import 'components/note_card.dart';
import 'controller/note_service.dart';
import 'addnote.dart';
import 'model/note.dart';

void main() => runApp(MaterialApp(theme: ThemeData.dark(), home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NoteService _noteService = NoteService();
  Note newNote = Note(title: "", dateTime: DateTime.now(), description: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          );
          setState(() {
            _noteService.addNote(note: newNote);
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('note_app_hw')),
      body: ListView.builder(
        itemCount: _noteService.notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
            note: _noteService.notes[index],
            color: colorPool[index % colorPool.length],
            onPressed: () {
              setState(() {
                _noteService.deleteNote(index: index);
              });
            },
          );
        },
      ),
    );
  }
}
