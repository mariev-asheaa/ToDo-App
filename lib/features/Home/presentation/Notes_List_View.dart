import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/Add_Note/view_models/Fetch_notes_cubit/fetch_notes_cubit.dart';
import 'package:to_do/features/Home/presentation/Note.dart';




class NotesListView extends StatelessWidget {
  const NotesListView({super.key,
    required this.onNoteCardActiveStateChanged, required this.categoryIndex,});

  final Function(bool,String?) onNoteCardActiveStateChanged;//for the nav bar
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNotesCubit, FetchNotesState>(
      builder: (context, state) {
        if (state is FetchSuccess) {
          var categoryNotes =
          state.notes.where((note) => note.categoryIndex == categoryIndex).toList();

          return categoryNotes.isEmpty
              ?SizedBox()
              :AspectRatio(
               aspectRatio: 40 / 30,
               child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: categoryNotes.length,
               itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                   child: Note(
                     noteModel: categoryNotes[index],
                     onActiveStateChanged:  (bool isActive) {
                       onNoteCardActiveStateChanged(isActive,categoryNotes[index].docId);
                     },
                     docId: categoryNotes[index].docId??'',
                   )
                );
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
