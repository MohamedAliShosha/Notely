import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // used to provide the cubit to the widget tree

      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        // used to rebuild UI
        listener: (context, state) {
          if (state is AddNotesFailue) {
            print('failed ${state.errorMessage}');
          }

          if (state is AddNotesSuccess) {
            // if succees  then close the bottom sheet.
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading
                ? true
                : false, // if the state is loading then absorb the pointer
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
