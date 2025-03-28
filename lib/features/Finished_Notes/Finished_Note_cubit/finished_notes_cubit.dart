import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../Add_Note/models/Note_model.dart';

part 'finished_notes_state.dart';

class FinishedNotesCubit extends Cubit<FinishedNotesState> {
  FinishedNotesCubit() : super(FinishedNotesInitial());

  Future<void> toggleFinished(String docId, bool isCurrentlyFinished) async {
    emit(FetchFinishedNotesLoading());
    try {
      await FirebaseFirestore.instance.collection('notes').doc(docId).update({
        'isFinished': isCurrentlyFinished,
      });

      print("Note status updated");
    } catch (e) {
      print("Error updating note status: $e");
    }
  }

  Future<void> fetchFinishedNotes() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('notes')
          .where('id', isEqualTo:  FirebaseAuth.instance.currentUser!.uid)
          .where('isFinished', isEqualTo: true)
          .get();

      List<NoteModel> finishedNotes =  querySnapshot.docs.map((doc) {
        return NoteModel(
            title: doc['Title'],
            description: doc['Description'],
            categoryIndex: doc['category'],
            color:Color(doc['color']),
            docId: doc.id
        );
      }).toList();
      emit(FetchFinishedNotesSuccess(finishedNotes));
    } catch (e) {
      print(e.toString());
    }
  }
}
