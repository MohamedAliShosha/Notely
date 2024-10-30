part of 'add_notes_cubit.dart';

@immutable
abstract class AddNotesState {}

class AddNotesInitial extends AddNotesState {}

class AddNotesLoading
    extends AddNotesState {} // The time taken while adding note

class AddNotesSuccess extends AddNotesState {}

class AddNotesFailue extends AddNotesState {
  final String errorMessage;

  AddNotesFailue({required this.errorMessage});
}
