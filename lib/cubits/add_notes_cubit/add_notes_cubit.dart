import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../constants.dart';
import '../../models/note_model.dart';
// import 'package:meta/meta.dart';

part 'notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Color color = const Color(0xffCCDBDC); // default value

  addNote(NoteModel note) async // A method to add note
  {
    note.color = color.value;
    emit(AddNotesLoading()); // Loading state

    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note); // add accepts dynamic argument
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(errorMessage: e.toString()));
    }
  }
}
