import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
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
          return SingleChildScrollView(
            child: ModalProgressHUD(
                // Checking  if the state is loading
                inAsyncCall: state is AddNotesLoading ? true : false,
                child: const AddNoteForm()),
          );
        },
      ),
    );
  }
}
