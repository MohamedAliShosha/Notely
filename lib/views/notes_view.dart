import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Providing the cubit here is the same if it was provided in the main function as this screen is the main screen and will be existed all times
      create: (context) => NotesCubit(), // providing the NotesCubit
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff62FCD7),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true, // able to be scrollable
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
        body: const NotesViewBody(),
      ),
    );
  }
}
