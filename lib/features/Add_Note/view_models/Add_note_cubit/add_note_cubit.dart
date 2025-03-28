import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());


  Future<void> addNote({required String title,required String desc,required int categoryIndex,required Color color}) async {
    try {
      CollectionReference notes = FirebaseFirestore.instance.collection('notes');
      emit(AddNoteSuccess());

      return await notes.add(
          { 'Title': title, 'Description': desc, 'category': categoryIndex,
            'id':FirebaseAuth.instance.currentUser!.uid,
             'color':color.value,
            'isFinished': false,
          })
          .then((value) => print("Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

     catch (e) {
      emit(AddNoteError("Failed to add note"));
    }
  }

}
