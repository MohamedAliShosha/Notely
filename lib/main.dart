import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/note_model.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider used to provide multiple cubits to the app
    // I am using it here to provide AddNotesCubit to the entire app screens
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNotesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins', // This apply font to all text in the app
        ),
        home: const NotesView(),
      ),
    );
  }
}

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter(); // Initializing Hive.
  await Hive.openBox(kNotesBox); //  Opening the box to store notes.

  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}
