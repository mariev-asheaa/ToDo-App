import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/Finished_Notes/Finished_Note_cubit/finished_notes_cubit.dart';
import 'package:to_do/features/Finished_Notes/presentation/Finished_Notes_Grid.dart';
import 'package:to_do/features/Finished_Notes/presentation/Finished_Notes_Header.dart';
import 'package:flutter/material.dart';


class FinishedNotesBody extends StatefulWidget {
  const FinishedNotesBody({super.key});

  @override
  State<FinishedNotesBody> createState() => _FinishedNotesBodyState();
}
class _FinishedNotesBodyState extends State<FinishedNotesBody> {
  @override
  void initState() {
    super.initState();
    context.read<FinishedNotesCubit>().fetchFinishedNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishedNotesCubit, FinishedNotesState>(
      builder: (context, state) {
        if(state is FetchFinishedNotesLoading){
          return Center(child: CircularProgressIndicator(),);
        }
     else if (state is FetchFinishedNotesSuccess) {
          final finishedNotes = state.finishedNotes;
          return Column(
            children: [
              FinishedNotesHeader(),
              FinishedNotesGrid(finishedNotes: finishedNotes),
            ],
          );
        }
       else {
         return Center(
           child: Text(
             "No Finished Notes Yet",
             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
           ),
         );
       }
       }
    );
  }
}


