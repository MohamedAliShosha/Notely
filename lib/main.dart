import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/notes_view.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins', // This apply font to all text in the app
      ),
      home: const NotesView(),
    );
  }
}

void main() async {
  await Hive.initFlutter(); // Initializing Hive.
  await Hive.openBox(kNotesBox); //  Opening the box to store notes.

  runApp(const NotesApp());
}
