import 'package:bloc/bloc.dart';
import 'package:notes_app/models/note_model.dart';
// import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<AddNotesState> {
  NotesCubit() : super(AddNotesInitial());

  addNote(NoteModel note) // A method to add note
  {}
}
