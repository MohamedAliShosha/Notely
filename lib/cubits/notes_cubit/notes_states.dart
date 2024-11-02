import 'package:notes_app/models/note_model.dart';

class NotesStates {}

class NotesInitial extends NotesStates {}

class NotesLoading extends NotesStates {}

class NotesSuccess extends NotesStates {
  final List<NoteModel> notes;

  NotesSuccess(this.notes);
}

class NotesFailure extends NotesStates {
  final String errormessage;

  NotesFailure({required this.errormessage});
}
