import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_Bar.dart';
import 'notes_listView.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() // The fisrt method called
  {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        // Takes all the available space too => So I should give a specified height to the listView or it's better to use expand with the listView

        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
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
