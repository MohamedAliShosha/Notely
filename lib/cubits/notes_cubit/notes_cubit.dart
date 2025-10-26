import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constants.dart';
import 'notes_states.dart';
import '../../models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    notesBox.values.toList();
    emit(NotesSuccess());
  }
}
