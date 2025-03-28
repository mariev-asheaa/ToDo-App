import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitial());
  Future<void> deleteNote({required String docId}) async {
    try {
      await FirebaseFirestore.instance.collection('notes').doc(docId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
