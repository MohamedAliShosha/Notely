import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_Bar.dart';

import 'custom_note_item.dart';
import 'notes_listView.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        // Takes all the available space too => So I should give a specified height to the listView or it's better to use expand with the listView

        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(),
          // NoteItem(),
          Expanded(
            child:
                NotesListView(), // Takes all the available space => In this case an exception will be thrown because it is inside a Column &  Column can't have a child that takes all the available space
          ),
        ],
      ),
    );
  }
}
