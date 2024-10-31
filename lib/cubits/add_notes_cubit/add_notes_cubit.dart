import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
// import 'package:meta/meta.dart';

part 'notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  addNote(NoteModel note) async // A method to add note
  {
    emit(AddNotesLoading()); // Loading state

    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note); // add accepts dynamic argument
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailue(errorMessage: e.toString()));
    }
  }
}
