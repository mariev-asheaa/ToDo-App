import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditInitial());

  Future<void> editNote({required String title,required String description,required String docId,required Color color}) async {

    try {
      CollectionReference notes = FirebaseFirestore.instance.collection('notes');
      await notes.doc(docId).update({
        'Title': title,
        'Description': description,
        'color':color.value
      });

      emit(EditSuccess());
    } catch (e) {
      print(e.toString());
    }
  }
}

