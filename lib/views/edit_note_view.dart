import 'package:flutter/material.dart';
import '../models/note_model.dart';

import 'widgets/edit_View_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note; // Sending the note that will be edited

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
