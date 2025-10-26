import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'constants.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'simple_bloc_observer.dart';
import 'views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/note_model.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider used to provide multiple cubits to the app
    // I am using it here to provide AddNotesCubit to the entire app screens
    return BlocProvider(
      create: (context) => NotesCubit(),
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
  Hive.registerAdapter(
      NoteModelAdapter()); // Should be called before opening the box

  await Hive.openBox<NoteModel>(
      kNotesBox); // Opening the box to store notes , it's important to specify data type here

  runApp(const NotesApp());
}
